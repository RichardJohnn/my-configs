set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'rails.vim'
Bundle 'taglist.vim'
Bundle 'The-NERD-tree'
Bundle 'vcscommand.vim'
Bundle 'project.tar.gz'
Bundle 'AutoComplPop'
Bundle 'The-NERD-Commenter'
Bundle 'surround.vim'
Bundle 'scrooloose/syntastic'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'wting/rust.vim'

"Language autocompletion
Bundle 'JSON.vim'
Bundle 'cocoa.vim'
Bundle 'scala.vim'
Bundle 'Erlang-plugin-package'
Bundle 'Hackerpilot/Dscanner'
Bundle 'VimClojure'
Bundle 'haskell.vim'
Bundle 'checksyntax-B'
Bundle 'vim-coffee-script'
Bundle 'dbext.vim'
Bundle 'SQLComplete.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'go.vim'
Bundle 'adimit/prolog.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'nono/vim-handlebars'
Bundle 'darthdeus/vim-emblem'
Bundle 'applescript.vim'
Bundle 'kongo2002/fsharp-vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'tpope/vim-cucumber'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath.git'
Bundle 'tpope/vim-fireplace'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'Valloric/YouCompleteMe'

set showcmd
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set number
set incsearch
set autowrite
syntax on

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Make the mouse work
set mouse=a
set cursorline

" Turn on auto indenting for pasted code
set pastetoggle=<F2>

filetype plugin indent on

if has("gui_running")
    colorscheme molokai
    set guifont=Consolas:h12
endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
