echo 'hello from bash'

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


export PS1="\u\[\033[0;35m\] \$(abbrv_wd \w)\[\033[32m\]\$(parse_git_branch)\[\033[33m\] ♘\[\033[00m\]  "
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


# Surpress annoying zsh plug on Catalina

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

export PATH

source ~/.zsh/aliases
source ~/.zsh/bash_aliases


# "extentions", source anything that begins with .bash_

for i in $(ls -a $HOME); do
    if [[ "$i" =~ ^.bashext_ ]]; then
        source "$HOME/$i";
    fi
done

# Default editor
export EDITOR=vim
