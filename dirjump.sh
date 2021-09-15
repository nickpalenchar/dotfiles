#!/usr/bin/env bash

# dirjump - set marks on directory paths and go back to them
#
# COMMANDS:
#   mark <n> - mark the current directory with letter <n>
#   jump <n> - jump to the directory marked by letter <n>
#   last - jump to the most recently marked directory that isnt
#          the current working one (multiple times toggles between two)
#   list - list all marked directories
#   clear <n> - clear directory with mark <n>
#   clear-all - clear all directory marks

mkdir -p /var/dirjump

from-mark () {
  set -u
  
  echo "$(grep "^${1}" /var/dirjump/marks | cut -d' ' -f 2-)"

}

case "$1" in

  mark)
    set -u
    if [[ "$(from-mark $2)" ]]; then
      echo 'mark already exists'
      exit 0
    fi
    
    echo "$2 $(pwd)" | cat - /var/dirjump/marks | sort >> /var/dirjump/marks
  ;;


esac
