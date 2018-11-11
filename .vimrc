" syntax highlighting
syntax enable

" opening a new file when the current buffer has unsaved
" changes causes files to be hidden instead of closed
set hidden

" indentation
filetype plugin indent on
set expandtab shiftwidth=2 softtabstop=2 tabstop=2
set smartindent

" Put the swap files in another folder
set directory=$HOME/.vim/swap//

" Show matching parentheses
set showmatch

" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" Eliminating delays on ESC
set timeoutlen=1000 ttimeoutlen=0

" cd to currently active file on tab/buffer open
set autochdir

call plug#begin('~/.vim/plugs')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'jordwalke/VimCompleteLikeAModernEditor' | Plug 'jordwalke/AutoComplPop'
Plug 'vim-scripts/grep.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plus 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug ''

call plug#end()

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
autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T

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

let b:syntastic_checkers = ['standard']
if executable('node_modules/.bin/standard')
  let b:syntastic_javascript_standard_exec = 'node_modules/.bin/standard'
endif

