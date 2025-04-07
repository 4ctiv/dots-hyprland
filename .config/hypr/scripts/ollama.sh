#!/bin/bash

# https://ollama.com/library
MODEL="deepseek-coder:6.7b"
#MODEL="deepseek-r1:14b"

HELP_MSG='Help page for '$0'
Usage: '$(echo $0 | sed 's|.*/||g')' [flag] [model]

|----------------|
| Avalable Flags |
|----|-----------------------------------------|
| -h | --help       ~ Display this message     |
| -b | --background ~ run ollama in background |
| -d | --detatch                 "             |
| -k | --kill       ~ stop ollama container    |
| -s | --stop       ~            "             |
|----|-----------------------------------------|'

trap 'docker network disconnect bridge ollama; docker stop ollama 2>/dev/null' SIGINT

docker ps >/dev/null 2>/dev/null
if [ ! $? -eq 0 ]; then
  echo "Please start docker first"
  exit 1
fi

function ollama_start {
# Check if ollama container already exists
if [ -z "$(docker ps -a --format '{{.Names}}' | grep -o -E '[O|o]llama')" ]; then
  # inxi -G  # list graphical devices (human readable)
  lsmod | grep i915 >/dev/null 2>/dev/null
  if [ $? ]; then
    # Intel ARC driver loaded
    # -> https://dev.to/itlackey/run-ollama-on-intel-arc-gpu-ipex-4e4k
    docker run -d \
       --name=ollama \
       --restart=always \
       --net=bridge \
       --device=/dev/dri \
       -p 11434:11434 \
       -v ~/.ollama/models:/root/.ollama/models \
       -e PATH=/llm/ollama:$PATH \
       -e OLLAMA_HOST=0.0.0.0 \
       -e no_proxy=localhost,127.0.0.1 \
       -e ZES_ENABLE_SYSMAN=1 \
       -e OLLAMA_INTEL_GPU=true \
       -e ONEAPI_DEVICE_SELECTOR=level_zero:0 \
       -e DEVICE=Arc \
       --shm-size="16g" \
       --memory="32G" \
       intelanalytics/ipex-llm-inference-cpp-xpu:latest \
       bash -c "cd /llm/scripts/ && source ipex-llm-init --gpu --device Arc && bash /llm/scripts/start-ollama.sh && tail -f /llm/ollama/ollama.log"
  else
    # Software support (may work with amd graphics)
    docker run -d --gpus=all --name ollama ollama/ollama:latest
  fi
fi

# Start ollama if no already running
echo "Starting ollama"
docker start ollama >/dev/null 2>/dev/null
sleep 3s;

# Start gui for easy access
#if [ -f "$(which Chatbox)" ]; then
#  # Note: This will only work if ollama has internet access
#  # Maybe this can be "fixed" by adding `--add-host=ollama.local:10.0.0.1` to ollama
#  nohup Chatbox > /dev/null 2>&1 &
#fi
}

function ollama_pull {
# Pull ollama model if required
echo "Reciving ollama $MODEL"
docker network connect bridge ollama 2>/dev/null # give container network access
docker exec -it ollama ollama pull "$MODEL"
docker network disconnect bridge ollama          # remove container network access
}

function ollama_run {
# Run ollama model
echo "Starting ollama $MODEL"
docker exec -it ollama ollama run "$MODEL"
}

function ollama_stop {
# Shutdown ollama
echo "Stopping ollama container"
docker stop ollama >/dev/null 2>/dev/null
#docker container rm ollama > /dev/null 2>/dev/null
}

if [ ! -z "$1" ]; then
  if [ ! -z "$2" ]; then
    MODEL="$(echo "$2" | awk '{print $NF}')"
  fi
  case "$1" in
  "-h"|"--help")
    printf "$HELP_MSG"
   exit 0
    ;;
  "-k"|"--kill"|"-s"|"--stop")
    docker network disconnect bridge ollama;
    docker stop ollama 2>/dev/null;
    exit $?
    ;;
  "-d"|"--detatch"|"-b"|"--background")
    echo "Starting ollama in background"
    ollama_start;
    ollama_pull;
    docker network connect bridge ollama 2>/dev/null
    echo "[WARNING] Ollama is running in the background and is given access to the internet (to enable frontent api access)"
    ;;
  "*") # Expect model was given
    MODEL="$(echo "$1" | awk '{print $NF}')"
    ollama_start ;
    ollama_pull;
    ollama_run;
    ollama_stop;
    ;;
  esac
else
  ollama_start;
  ollama_pull;
  ollama_run;
  ollama_stop
fi

exit 0

