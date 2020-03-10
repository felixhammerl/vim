" syntax highlighting
syntax enable

call plug#begin('~/.vim/plugs')

Plug 'https://github.com/dracula/vim', { 'as': 'dracula' }
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-projectionist.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/editorconfig/editorconfig-vim.git'
Plug 'https://github.com/alvan/vim-closetag'
Plug 'https://github.com/stephpy/vim-yaml'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

" Sets the leader key
let mapleader = ","

" opening a new file when the current buffer has unsaved
" changes causes files to be hidden instead of closed
set hidden

" use system clipboard
set clipboard=unnamed

" use hybrid line numbers
set number relativenumber

" use mouse
set mouse=a

" double click to search
map <2-LeftMouse> *``

" highlight search results and clear with escape
set hlsearch
nnoremap <silent> <esc> :noh<cr><esc>

" use dracula color scheme
color dracula

" indentation
filetype plugin indent on
set expandtab shiftwidth=2 softtabstop=2 tabstop=2
set smartindent
set nowrap

" Put the swap files in another folder
set directory=$HOME/.vim/swap/

" Show matching parentheses
set showmatch

" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" Eliminating delays on ESC
set timeoutlen=1000 ttimeoutlen=0

" closetags and delimitmate
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }
silent! nmap <C-P> :GFiles<CR>

" airline
let g:airline_theme='sol'
let g:airline_powerline_fonts = 1
let g:_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " only show filename in buffer tabline tabs
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" NERD Tree
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '.DS_Store']
let NERDTreeShowHidden=1
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>

