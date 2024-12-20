# Dynamically scopes history to the working directory only

function set_directory_history() {
  export HISTFILE="$HOME/.zsh_dirhistory/$(pwd | sed 's|/|_|g')"
  if [[ -f "$HISTFILE" ]]; then
    # load the new histfile into history
    builtin fc -R "$HISTFILE"
  else
    builtin fc -p
  fi
}

set_directory_history
autoload -U add-zsh-hook
add-zsh-hook chpwd set_directory_history

