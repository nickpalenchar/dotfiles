
set nocompatible

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
      syntax on
endif

syntax on
filetype plugin indent on
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme molokai
set number

set wrap
set formatoptions=tcqrn1

" TAB SIZING
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab
    set noshiftround

    " XXX Override tabs for other filetypes
    autocmd Filetype python setlocal ts=4 sw=4 expandtab

set number
set showcmd
set cursorline

set wildmenu

set lazyredraw

set showmatch

set incsearch " 'increment search' - hihlight as searching
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

set foldenable
set foldlevelstart=10

nnoremap gV `[v`]

"uu will escape insert mode (because Dvorak)"
inoremap uu <Esc> 

set visualbell " prevent noises


" Abbreviations "
abbr `f function
abbr `w while
abbr `e else
abbr `d elif
abbr `r return
"abbr ;iter for\si\sin\srange\(len\(

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>



" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" From https://vim.fandom.com/wiki/Example_vimrc
    set nostartofline
    set ruler
    set laststatus=2
    set confirm
    if has('mouse')
      set mouse=a
    endif

    " Quickly time out on keycodes, but never time out on mappings
    set notimeout ttimeout ttimeoutlen=200
    " ctrl+l clears search highlights
    nnoremap <C-L> :nohl<CR><C-L>

" KEYMAPS
nmap <C-d> yyp
