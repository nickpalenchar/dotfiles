#!/usr/bin/env bash 
#set -x

########################
# ADDITIONAL MAUNAL STEPS
# ######################3
#
# The following should be installed manually:
# * UbuntuMono (https://www.nerdfonts.com/font-downloads) - for NvChad


#######
# zsh
######

#chsh -s /bin/zsh

if [[ -z "$(which brew)" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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

### diff-so-fancy

if [[ -z "$(which diff-so-fancy)" ]]; then
    brew install diff-so-fancy
fi

### ncdu

if [[ -z "$(which ncdu)" ]]; then
    brew install ncdu
fi

### y

if [[ -z "$(which yq)" ]]; then
    echo "installing yq"
    pip3 install yq
fi

if [[ -z "$(which telnet)" ]]; then
  echo "installing telnet"
  brew install telnet
fi


# https://github.com/junegunn/vim-plug
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
  echo "installing vim-plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


# ack
if [[ -z "$(which ack)" ]]; then
  echo "installing ack"
  brew install ack
fi
