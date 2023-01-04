iso() { [[ -z "$1" ]] && echo $(date -u +"%Y-%m-%d") || echo $(date -u +"%Y-%m-%d.$1") ; }
ist() { [[ -z "$1" ]] && echo $(date -u +"%Y-%m-%dT%H-%M-%S") || echo $(date -u +"%Y-%m-%dT%H-%M-%S.$1") ; }
