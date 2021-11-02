call plug#begin('~/.vim/plugged')

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

call plug#end()

" Find and source existing .vimrc
set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc:
