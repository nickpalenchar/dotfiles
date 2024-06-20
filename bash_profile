export BASH_SILENCE_DEPRECATION_WARNING=1

function man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}


abbrv_wd() {
    # used to abbreviate the file path (takes a file path)
    
    local FPATH=$(echo $1 | sed 's`'"$HOME"'`~`')
    LENGTH=$(echo $FPATH | sed -E "s/[^\/]//g" | wc -c)
    
    if [[ "$LENGTH" -gt 3 ]]; then
        END=$(echo $FPATH | grep -Eo "[^\/]*\/[^\/]*\/[^\/]*$")
        ABBRV=$( echo $FPATH | sed -E "s/(\/.)[^\/]*/\1/g")
        ABBRV=${ABBRV/%??????/}
        FINAL=${ABBRV}/${END}
        echo $FINAL
    else
        echo $FPATH
    fi
}

# https://www.shellhacks.com/bash-colors/
CCYAN="\[\e[36m\]"
CPURPLE="\[\e[35m\]"
CGREEN="\[\e[32m\]"
CYELLOW="\[\e[33m\]"
CEND="\[\e[0m\]"
export PS1="$CCYAN\u $CPURPLE\$(abbrv_wd \w)$CGREEN\$(parse_git_branch)$CYELLOW λ$CEND "
export PS2="→ "

PATH=$PATH:/usr/local/bin/; export PATH

export PATH=~/.local/bin:$PATH


alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ~="cd ~"                              # ~:            Go Home
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias c='clear'

alias py3='python3'

# tldr - fix for bug
export LANG='none'


# git bash completion!
# --------------------
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

export PATH

source ~/.zsh/aliases
source ~/.zsh/bash_aliases

# DIRJUMP #

source ~/.dirjump-aliases


# "extentions", source anything that begins with .bash_

for i in $(ls -a $HOME); do
    if [[ "$i" =~ ^.bashext_ ]]; then
        source "$HOME/$i";
    fi
done

# Default editor
export EDITOR=vim


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

for file in "$HOME/.shell-aliases/*"; do
  source "$HOME/.shell-aliases/$file"
done

for file in "$HOME/shell-extensions.local/*"; do
  source "$HOME/shell-extensions.local/*"
done


source /Users/nick/.docker/init-bash.sh || true # Added by Docker Desktop
