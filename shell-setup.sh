#!/usr/bin/env bash 
#set -x

########################
# ADDITIONAL MAUNAL STEPS
# ######################3
#
# The following should be installed manually:
# * UbuntuMono (https://www.nerdfonts.com/font-downloads) - for NvChad


##
if [[ -z "$(which cargo)" ]]; then
  echo 'installing cargo'
  curl https://sh.rustup.rs -sSf | sh
  echo 'done'
fi


###
# sd (better sed)
# ##
if [[ -z "$(which sd)" ]]; then
  echo 'installing sd'
  cargo install sd
  echo 'done'
fi

if [[ -z "$(bash -c 'which brew')" ]]; then
    echo 'installing brew'
    NONINTERACTIVE=1  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'done'
fi

#########
# iPython
# #######

if [[ -z "$(which pipx)" ]]; then
  echo "setting up pipx"
  brew install pipx
  pipx ensurepaths
fi

if [[ -z "$(bash -c 'which ipython')" ]]; then
    echo "setting up ipython"
    pipx install ipython
fi 

### yq

if [[ -z "$(bash -c 'which yq')" ]]; then
    echo "installing yq"
    pip3 install yq
fi

if [[ -z "$(bash -c 'which telnet')" ]]; then
  echo "installing telnet"
  brew install telnet
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
git submodule add https://github.com/zsh-users/zsh-autosuggestions $HOME/dotfiles/autosuggest

# ctop (docker visualizer)
if [[ -z "$(which ctop)" ]]; then
  echo "installing ctop"
  brew install ctop
fi



