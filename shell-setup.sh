#!/usr/bin/env bash 
#set -x

########################
# ADDITIONAL MAUNAL STEPS
# ######################3
#
# The following should be installed manually:
# * UbuntuMono (https://www.nerdfonts.com/font-downloads) - for NvChad


##
# cargo
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



#######
# zsh
######

#chsh -s /bin/zsh

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
