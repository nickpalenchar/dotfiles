preexec() {
  if [ "$(id -u)" -ne 0 ] && [ -z "$NOLOG" ] && [[ ! "$3" =~ "~/.logs" ]] && [[ ! "$(pwd)" =~ "$HOME/.logs" ]]; then
    echo "$(date "+%Y-%m-%d.%H:%M") $(pwd) $ $3" >> ~/.logs/zsh-history-$(date "+%Y-%m-%d").log
  fi
}
