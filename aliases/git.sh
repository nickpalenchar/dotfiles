#!/bin/bash
alias gc='git commit'
alias gs='git status'

alias grbc='git rebase --continue'

function gpr () {
  local current_branch="$(git rev-parse --abbrev-ref HEAD)"
  echo "Pushing to branch [$current_branch]"
  git push origin $current_branch
}
