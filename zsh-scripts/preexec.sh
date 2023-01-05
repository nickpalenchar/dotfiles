
# this zshhook checks the command to see if an alias was
# available, and informs the user if so.
#
#   $ alias foo='touch test.txt'
#   $ touch test.txt
#   💡 could've been 'foo'
#   $

preexec() {
  escape_regex() {
    local word=$1
    local final=""
    for (( i=0; i<${#word}; i++ )); do
      local char=${word:$i:1}
      if [[ "$char" =~ [\.\$\/] ]]; then
        final="${final}\\${char}"
      else
        final="${final}${char}"
      fi
    done
    echo $final
  }

  autoload -U colors && colors
  local command="$(echo $1 | awk '{ print $1 }' )"
  local command_aliases="$(alias | grep ".*='\?${command}")"

  ## TODO: need to match on literal match and not regex
  ## things like `..` match many things so its not right
  command="$(escape_regex $1)"
  local full_alias=$(echo $command_aliases | awk -F '=' "/.*\='?$command'?\$/ { print \"'\" \$1 \"\'\" }" 2>/dev/null | tr '\n' ' ' )

  if [[ "$full_alias" ]]; then
    echo "${YELLOW}💡 could've been ${CYAN}${full_alias}${RESET}"
    sleep 0.4
  fi
}
