mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias ex='exit'
alias tx='tmux'
alias cdm='cd ~/mason'
alias ff=fff

# move the last downloaded file to the current directory or $1
mvd() {
  local DEST=${1:-.}
  local LAST_DL="$(ls -t | head -n 1)"
  echo "> mv $LAST_DL $DEST/"
  mv $LAST_DL $DEST/
}

