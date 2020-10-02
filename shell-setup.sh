#!/usr/bin/env bash 
#set -x

#######
# zsh
######

#chsh -s /bin/zsh

if [[ -z "$(which brew)" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

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

if [[ -z "$(which how2)" && -n "$(which npm)" ]]; then
    echo "setting up how2"
    sudo npm install -g how-2
fi

#########
# iPython
# #######

if [[ -z "$(which ipython)" ]]; then
    echo "setting up ipython"
    if [[ -n "$(which pip)" ]]; then
        pip install ipython
    elif [[ -n "$(which pip3)" ]]; then
        pip3 install ipython
    fi
fi 

#####
# fff
# ###
#

if [[ -z "$(which fff)" ]]; then
    brew install fff
fi
