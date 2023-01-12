alias gs='git status'
alias gsp='git stash pop'
alias gd='git diff'
alias gds='git diff --staged'
alias ga.='git add .'
alias g..='git checkout @{-1}'
gac() { git add -A && git commit -am "$1"; }
gacr() { gac "$@" && gpr; }
alias gpr=gpb
gpb() {
  BRANCH=$(git branch | grep \*|cut -c3-);
  echo "pushing to [$BRANCH]";
  git push origin $BRANCH $@;
}


rrebase() {
  set -u

  git checkout $1
  git pull origin $1
  g..
  git rebase $1
  echo 'happy hacking :)'
  set +u
}

alias gcm='git checkout main || git checkout master'
