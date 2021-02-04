"automated installation of vimplug if not installed

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

" airline
let g:airline_theme='sol'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " only show filename in buffer tabline tabs

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

" Disable annoying messages about swap files
set shortmess+=A

" Eliminating delays on ESC
set timeoutlen=1000 ttimeoutlen=0

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" closetags and delimitmate
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
au FileType xml,html,phtml,php,xhtml,js,python let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }
silent! nmap <C-P> :Files<CR>

" NERD Tree
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '.DS_Store', '\.git$', '__pycache__$']
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>

let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-pyright',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-tsserver'
\ ]

