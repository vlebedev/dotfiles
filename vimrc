set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mrtazz/simplenote.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'mustache/vim-mode'
Bundle 'plasticboy/vim-markdown'
Bundle 'vim-scripts/taglist.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'scrooloose/nerdtree'

syntax enable
filetype plugin indent on

" general settings
set ruler
set number
set textwidth=78
set copyindent
set shiftwidth=2           " tab indentation
set tabstop=2              " how big is ur tab
set expandtab              " tabs are evil if not spaces
set softtabstop=2          " softtabs are 4 spaces wide
set shiftround
set bs=2                   " backspacing over everything
set incsearch
set ignorecase
set encoding=utf-8
set cursorline
set autowriteall
" set colors
set t_Co=256

" use open buffers
set switchbuf=useopen

" use solarized palette incase it's used
set background=dark
let g:solarized_termcolors=256

syntax on
if has("gui_running")
    colorscheme solarized
    set go-=T
    set guifont=Monospace\ 10
    set antialias
else
    "let g:rehash256 = 1
    "let g:molokai_original = 1
    "colorscheme molokai
    colorscheme solarized
    set background=dark
endif

" some information in the statusline
set statusline=[%n]\ %t\ %y\ %{fugitive#statusline()}\ (%l,%c)\ %m\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
set laststatus=2

" tab completion for file opening
set wildmode=longest,list,full
set wildmenu
set wildignorecase

" command shortcuts
let mapleader=","

map <leader>w <C-w>
map <leader>b :sb
map <leader>m :make<CR>
map <leader>p :CtrlP<CR>
map <leader>i :Simplenote -o 9f44af62f552a6107fdf40fb499f9ad4<CR>

" open ctags definition in new tab
"map <C-\> :tab split<CR>:exec("tag \".expand("<cword>"))<CR>
" open ctags definition in horizontal split
map <C-\> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
" open ctags in vertical split
map <leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" remove unneeded spaces for a good whitespace carbon footprint
autocmd BufWritePre * :%s/\s\+$//e

" Supertab settings
let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&completefunc:<c-x><c-u>",
\ "&omnifunc:<c-x><c-o>",
\ ]
let g:SuperTabLongestHighlight = 1

" set indents for python files
au FileType python setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4
" set indents for coffescript files
au FileType coffee setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4
" set indents for html files
au FileType html setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4
" set indents for php files
au FileType php setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4
" handle .json files as javascript
autocmd BufNewFile,BufRead *.json set filetype=javascript

" set backup and swap dir to specific folder to play nice with open files in
" dropbox
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" activate spell checker in insert mode
autocmd InsertEnter *.tex setlocal spell
autocmd InsertLeave *.tex setlocal nospell

if filereadable($HOME."/.simplenoterc")
  exec ":source ". $HOME . "/.simplenoterc"
endif

let g:mustache_abbreviations = 1

autocmd QuickFixCmdPost * nested cwindow | redraw!
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=4 expandtab
autocmd BufNewFile,BufReadPost *.html setl shiftwidth=4 expandtab

let g:SimplenoteUsername="valebedev@gmail.com"
let g:SimplenotePassword="cukaha79"
let g:SimplenoteListHeight=30
let g:SimplenoteFiletype="markdown"
let g:SimplenoteSortOrder="pinned,modifydate"

let g:tlist_coffee_settings = 'coffee;f:function;v:variable'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

source $VIMRUNTIME/mswin.vim
behave mswin
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

