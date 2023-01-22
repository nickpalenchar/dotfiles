# addail <alias> <cmd> [<file>]
#
# Adds an alias to the dotfiles.
#
#   alias - the ailas
#   cmd - the command to run.
#   file - the file within the aliases directory to append to


addail() {
  set -e

  file=${3:-"added.sh"}
  cmd=${2}
  echo "alias ${1}='${cmd}'" >> "${HOME}/dotfiles/zsh-scripts/${file}"
  eval `alias ${1}='${cmd}'`

  echo "Added. Alias is now available in this shell"
}
