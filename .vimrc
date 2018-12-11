" syntax highlighting
syntax enable

call plug#begin('~/.vim/plugs')

Plug 'https://github.com/dracula/vim', { 'as': 'dracula' }
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-projectionist.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/editorconfig/editorconfig-vim.git'
Plug 'https://github.com/alvan/vim-closetag'
Plug 'https://github.com/stephpy/vim-yaml'
Plug 'https://github.com/mustache/vim-mustache-handlebars'
Plug 'https://github.com/othree/html5.vim'
Plug 'https://github.com/neoclide/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'https://github.com/hail2u/vim-css3-syntax.git', { 'for': 'css' }
Plug 'https://github.com/digitaltoad/vim-pug.git'
Plug 'https://github.com/groenewege/vim-less'
Plug 'https://github.com/othree/csscomplete.vim'
Plug 'https://github.com/Chiel92/vim-autoformat.git'
Plug '/usr/local/opt/fzf'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

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

" cd to currently active file on tab/buffer open
set autochdir

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
let NERDTreeIgnore = ['\.pyc$', '\.swp$']
let NERDTreeShowHidden=1
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>

" Trigger configuration on CTRL-b
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips/"
let g:UltiSnipsEditSplit="vertical"

" Ale config
let g:ale_linters = {
      \ 'javascript': ['standard'],
      \}
let g:ale_fixers = {
      \ 'json': ['jq', 'trim_whitespace', 'remove_trailing_lines'],
      \ 'javascript': ['standard']
      \}
let g:ale_linter_aliases={
      \ 'javascript': ['javascript', 'javascript.jsx', 'jsx'],
      \}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_set_ballons = 1
let g:ale_close_preview_on_insert = 1
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '⌦'
let g:ale_sign_warning = '☞'
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" deoplete
let g:deoplete#enable_at_startup = 1

" langclient settings
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ 'jsx': ['javascript-typescript-stdio'],
      \ 'css': ['vscode-css-languageserver-bin'],
      \ }
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

