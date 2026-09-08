function list-docker-ports --wraps='docker ps' --description 'Show Docker containers grouped by activity'
  set -l cols "$(/usr/bin/tput cols)"
  set -l col "$(math --scale=0 "$cols / 4 - 1")"

  echo "Docker Container Ports (Running): "
  echo "| $(printf "%-30.30s" "Name") | $(printf "%-120.120s" "Ports") |"
  echo "|--------------------------------|--------------------------------------------------------------------------------------------------------------------------|"
  docker ps $argv --filter status=running --format '| {{.Names | printf "%-30.30s"}} | {{.Ports | printf "%-120.120s" }} |'

end
