mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias ex='exit'
alias tx='tmux'
alias cdm='cd ~/mason'
alias ff=fff

# Usage: mvd [destination=.] [source=~/Downloads]
# move the last downloaded file to the current directory or $1
mvd() {
  local DEST=${1:-.}
  local LOOKIN=${2:-"$HOME/Downloads"}
  local LAST_DL="$(/bin/ls -t $LOOKIN | head -n 1)"
  echo "> mv $LAST_DL $DEST/"
  mv $LOOKIN/$LAST_DL $DEST/
}

alias dfs='cd ~/dotfiles'
