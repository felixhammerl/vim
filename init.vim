"automated installation of vimplug if not installed

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Install vim plugins

call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'stephpy/vim-yaml'

call plug#end()

set encoding=UTF-8

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
set undodir=~/.nvim/undo
set directory=~/.nvim/swp
set backupdir=~/.nvim/backup

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

" NERD Tree
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '.DS_Store']
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>

" Install CoC extensions
" Installation via CoC is simpler than through Plug
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-pyright',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-tsserver'
\ ]

