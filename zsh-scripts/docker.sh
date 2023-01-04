dshell() { docker exec -it $1 bash || docker exec -it $1 sh; }
alias dps="docker ps"
docker-stop-all() { docker ps | awk 'NR>1 {print $1}' | xargs -I%  docker stop %; }
