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

if [[ -z "$(bash -c 'which brew')" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi


#########
# iPython
# #######

if [[ -z "$(bash -c 'which ipython')" ]]; then
    echo "setting up ipython"
    if [[ -n "$(bash -c 'which pip')" ]]; then
        pip install ipython
    elif [[ -n "$(bash -c 'which pip3')" ]]; then
        pip3 install ipython
    fi
fi 

### ncdu

if [[ -z "$(bash -c 'which ncdu')" ]]; then
    brew install ncdu
fi

### y

if [[ -z "$(bash -c 'which yq')" ]]; then
    echo "installing yq"
    pip3 install yq
fi

if [[ -z "$(bash -c 'which telnet')" ]]; then
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
if [[ -z "$(bash -c 'which ack')" ]]; then
  echo "installing ack"
  brew install ack
fi

# git-delta
if [[ -z "$(bash -c 'which delta')" ]]; then
  echo "installing git-delta"
  brew install git-delta
fi

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
