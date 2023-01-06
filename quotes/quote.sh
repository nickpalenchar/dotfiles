

quotes() {
  local file=$1
  local lines="$(( $(cat $file | wc -l) ))"
  local pick=$(( ( $RANDOM % ( $lines - 1 ) ) + 1 ))
  local line1="$(sed -n "$pick,${pick}p" $file)"
  (( pick++ ))
  local line2="$(sed -n "$pick,${pick}p" $file)"
  (( pick++ ))
  local line3="$(sed -n "$pick,${pick}p" $file)"
  (( pick++ ))
  local line4="$(sed -n "$pick,${pick}p" $file)"
  
  local quote=""
  local author=""
  if [[ "$line1" ]] && [[ "$line2" ]]; then
    quote=$line1
    author=$line2
  elif [[ "$line2" ]] && [[ "$line3" ]]; then
    quote=$line2
    author=$line3
  elif [[ "$line3" ]] && [[ "$line4" ]]; then
    quote=$line3
    author=$line4
  fi

  quote="$(echo $quote | fold -w 40 -s)"

  printf "\n\e[3m\e[90m"
  while IFS= read -r string; do
    printf "    $string\n"
  done <<< "$quote"
  printf "\e[0m\n"

  printf  "  \e[1m\e[90m --$author\e[0m\n\n"

}

quotes $@

