#!/bin/bash
alias gc='git commit'
alias gs='git status'

alias grbc='git rebase --continue'
alias M='git checkout main'
alias g..='git checkout -'

alias gd='git diff'
alias gds='git diff --staged'
alias gl='git pull'

function gpr () {
  local current_branch="$(git rev-parse --abbrev-ref HEAD)"
  echo "Pushing to branch [$current_branch]"
  git push origin $current_branch $@
}

rbM () {
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  local stash_needed=false

  restore_state() {
    git checkout "$current_branch"
    [ "$stash_needed" = true ] && git stash pop
  }

  if ! git diff-index --quiet HEAD --; then
    git stash push -u || return 1
    stash_needed=true
  fi
  
  echo 'Fetching origin...'
  git fetch origin || { restore_state; return 1; }
  echo 'Checking out main...'
  git checkout main || { restore_state; return 1; }
  echo 'Pulling from main...'
  git pull origin main || { restore_state; return 1; }
  echo "Checking out current branch: $current_branch"
  git checkout "$current_branch" || { restore_state; return 1; }
  echo 'Rebasing onto main...'
  git rebase main || { git rebase --abort; restore_state; return 1; }
  restore_state
  echo "Done!"
}
