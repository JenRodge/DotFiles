" VimPlug
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'rakr/vim-one'
"Plug 'rakr/vim-two-firewatch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'MartinLafreniere/vim-PairTools'
Plug 'scrooloose/nerdtree'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'jordwalke/VimSplitBalancer'
Plug 'vim-syntastic/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'dustinknopoff/TeaCode-Vim-Extension'
"Plug 'ryanoasis/vim-devicons'
Plug 'jfonseca8/vim-bujo'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

imap <C-e> <C-O>:call TeaCodeExpand()<CR>

let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tmuxline#enabled = 0

" Read *.md files as Markdown
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown

syntax enable
set viminfo=!,%,'100,<50,s10,h
set background=dark
set t_Co=256
set termguicolors
set hidden
set noequalalways
colorscheme one
set encoding=UTF-8
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set number
set guifont=Fira\ Code\:h14
set mouse=a
let g:indentLine_setConceal=2
" default ''.
" n for Normal mode
" v for Visual mode
" i for Insert mode
" c for Command line editing, for 'incsearch'
let g:indentLine_concealcursor = ""
set conceallevel=0

nmap <C-Enter> <Plug>bujo#AddTodoNormal
imap <C-Enter> <Plug>bujo#AddTodoInsert
nmap <C-BS> <Plug>bujo#CheckTodoNormal
imap <C-BS> <Plug>bujo#CheckTodoInsert

map <C-n> :NERDTreeToggle<CR>

" Colors for :terminal
"let g:terminal_ansi_colors = ['#353a44','#e88388','#a7cc8c','#ebca8d','#72bef2','#d291e4','#65c2cd','#e3e5e9','#353a44','#e88388','#a7cc8c','#ebca8d','#72bef2','#d291e4','#65c2cd','#e3e5e9']
let g:terminal_ansi_colors = ['#282c34', '#b35046', '#98c379', '#d19a66', '#61afef', '#c678dd', '#56b6c2', '#abb2bf', '#3b4048', '#e06c75', '#BDF397', '#e5c07b', '#67BBFF', '#E48AFF', '#69DEED', '#ffffff']
highlight Normal ctermbg=black
highlight Visual ctermbg=darkgrey

" Promptline Config
"let g:promptline_preset = {
"        \'a' : [ '\u@\h' ],
"        \'b' : [ '\W' ],
"        \'c' : [ promptline#slices#vcs_branch() ],
"        \'warn' : [ promptline#slices#last_exit_code() ]}
let host = system('hostname -s')[:-2]
if $USER == 'root'
    let aslicecolor = 075
elseif host == 'Revali'
    let aslicecolor = 110
elseif host == 'Prompto'
    let aslicecolor = 183
else
    let aslicecolor = 114
endif
let g:promptline_theme = {
    \'a'    : [233, aslicecolor],
    \'b'    : [231, 240],
    \'c'    : [188, 234],
    \'x'    : [188, 234],
    \'y'    : [231, 240],
    \'z'    : [233, aslicecolor],
    \'warn' : [232, 167]}


" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
    \'a' : [ "%n @ %m" ],
    \'b' : [ '%1~' ],
    \'c' : [],
    \'x' : [ promptline#slices#python_virtualenv() ],
    \'y' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
    \'z' : [],
    \'warn' : [ promptline#slices#last_exit_code() ]}

" available slices:
"
" promptline#slices#cwd() - current dir, truncated to 3 dirs. To configure: promptline#slices#cwd({ 'dir_limit': 4 })
" promptline#slices#vcs_branch() - branch name only. By default, only git branch is enabled. Use promptline#slices#vcs_branch({ 'hg': 1, 'svn': 1, 'fossil': 1}) to enable check for svn, mercurial and fossil branches. Note that always checking if inside a branch slows down the prompt
" promptline#slices#last_exit_code() - display exit code of last command if not zero
" promptline#slices#jobs() - display number of shell jobs if more than zero
" promptline#slices#battery() - display battery percentage (on OSX and linux) only if below 10%. Configure the threshold with promptline#slices#battery({ 'threshold': 25 })
" promptline#slices#host() - current hostname.  To hide the hostname unless connected via SSH, use promptline#slices#host({ 'only_if_ssh': 1 })
" promptline#slices#user()
" promptline#slices#python_virtualenv() - display which virtual env is active (empty is none)
" promptline#slices#git_status() - count of commits ahead/behind upstream, count of modified/added/unmerged files, symbol for clean branch and symbol for existing untraced files
" promptline#slices#conda_env() - display which conda env is active (empty is none)
"
" any command can be used in a slice, for example to print the output of whoami in section 'b':
"       \'b' : [ '$(whoami)'],
"
" more than one slice can be placed in a section, e.g. print both host and user in section 'a':
"       \'a': [ promptline#slices#host(), promptline#slices#user() ],
"
" to disable powerline symbols
" `let g:promptline_powerline_symbols = 0`
