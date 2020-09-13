execute pathogen#infect()

syntax on
filetype plugin indent on
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme molokai
set number

" Whitespace
set wrap
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

set number
set showcmd
set cursorline

filetype indent on
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

