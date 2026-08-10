function list-docker-services --wraps='docker ps' --description 'Show Docker containers grouped by activity'
  set -l cols "$(/usr/bin/tput cols)"
  set -l col "$(math --scale=0 "$cols / 4 - 1")"

  echo "Docker Containers (Running): "
  echo "| $(printf "%-30.30s" "ID") | $(printf "%-30.30s" "Image") | $(printf "%-30.30s" "Name") | $(printf "%-30.30s" "Mounts") | $(printf "%-30.30s" "Ports") |"
  echo "|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|"
  docker ps $argv --filter status=running --format '| {{.ID | printf "%-30.30s"}} | {{.Image | printf "%-30.30s"}} | {{.Names | printf "%-30.30s"}} | {{.Mounts | printf "%-30.30s"}} | {{.Ports | printf "%-30.30s" }} |'

  echo ""

  echo "Docker Containers (Exited): "
  echo "| $(printf "%-30.30s" "ID") | $(printf "%-30.30s" "Image") | $(printf "%-30.30s" "Name") | $(printf "%-30.30s" "Mounts") |"
  echo "|--------------------------------|--------------------------------|--------------------------------|--------------------------------|"
  docker ps $argv --filter status=exited --format '| {{.ID | printf "%-30.30s"}} | {{.Image | printf "%-30.30s"}} | {{.Names | printf "%-30.30s"}} | {{.Mounts | printf "%-30.30s"}} |'
end
