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


#load colors - https://stackoverflow.com/a/6159885
autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'

export PS1="${CYAN}%n ${MAGENTA}$(abbrv_wd %~) ${GREEN}$(parse_git_branch) ${YELLOW}λ${RESET} "

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


autoload -Uz compinit && compinit

