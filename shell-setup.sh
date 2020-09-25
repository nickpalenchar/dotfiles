#!/usr/bin/env zsh
set -x

#######
# zsh
######

chsh -s /bin/zsh

##############
# PREZTO
##############

if [[ ! -d "$HOME/.zprezto" ]]; then
    echo "setting up prezto"
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

