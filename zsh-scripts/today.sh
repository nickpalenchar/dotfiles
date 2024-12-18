
function today () {
  local TODAYFILE="$HOME/worklog/$(date +%Y-%m-%d.md)"

  if [ -e "$TODAYFILE" ]; then
    touch $TODAYFILE
  fi

  vim +$ $TODAYFILE
}
