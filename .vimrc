" syntax highlighting
syntax enable

call plug#begin('~/.vim/plugs')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/jordwalke/VimCompleteLikeAModernEditor.git'
Plug 'https://github.com/jordwalke/AutoComplPop.git'
Plug 'https://github.com/vim-scripts/grep.vim.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-projectionist.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/editorconfig/editorconfig-vim.git'
Plug 'https://github.com/pangloss/vim-javascript.git', { 'for': 'javascript' }
Plug 'https://github.com/mxw/vim-jsx.git', { 'for': 'javascript' }
Plug 'https://github.com/hail2u/vim-css3-syntax.git', { 'for': 'css' }

call plug#end()

" opening a new file when the current buffer has unsaved
" changes causes files to be hidden instead of closed
set hidden

" use system clipboard
set clipboard=unnamed

" use hybrid line numbers
set number relativenumber

" use mouse
set mouse=a

map <2-LeftMouse> *``
set hlsearch

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

" cd to currently active file on tab/buffer open
set autochdir

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" NERD Tree
let NERDTreeIgnore = ['\.pyc$', '\.swp$']
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>

" Open quick-fix selection in new tab
" autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T

" grep
nnoremap <silent><C-f> :Rgrep<CR>

" Airline
let g:airline_theme='deus'

" Trigger configuration on CTRL-b
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips/"
let g:UltiSnipsEditSplit="vertical"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_standard_generic = 1
let b:syntastic_javascript_standard_exec = 'standard'

