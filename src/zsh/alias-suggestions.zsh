# Alias suggestion hook
function suggest_alias() {
  local cmd="$1"
  local alias_found=""
  
  # Check if there's an alias for this command
  if alias "$cmd" 2>/dev/null | grep -q "alias $cmd="; then
    alias_found=$(alias "$cmd" | sed "s/alias $cmd='//;s/'$//")
  fi
  
  # Check for git aliases dynamically
  if [[ "$cmd" == git* ]]; then
    local git_cmd=$(echo "$cmd" | cut -d' ' -f2-)
    
    # Get all git-related aliases
    local git_aliases=$(alias | grep -E "^[a-z]+='git " | sed "s/alias \([^=]*\)='git \([^']*\)'/\1:\2/")
    
    # Look for a matching alias
    while IFS=: read -r alias_name alias_cmd; do
      if [[ "$git_cmd" == "$alias_cmd" ]]; then
        alias_found="$alias_name"
        break
      fi
    done <<< "$git_aliases"
  fi
  
  # If we found an alias, suggest it
  if [[ -n "$alias_found" ]]; then
    echo "💡 could have been \`$alias_found\`"
    sleep 2
  fi
}

# Hook to run before command execution
autoload -Uz add-zsh-hook
add-zsh-hook preexec suggest_alias 