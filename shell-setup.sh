#!/usr/bin/env zsh
set -x

#######
# zsh
######

#chsh -s /bin/zsh

##############
# PREZTO
##############

if [[ ! -d "$HOME/.zprezto" ]]; then
    echo "setting up prezto"
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi


########
# how2
#######

if [[ -z "$(which how2)" && -n "which npm" ]]; then
    echo "setting up how2"
    sudo npm install -g how-2
fi
