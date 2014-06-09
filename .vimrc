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
Bundle 'Lokaltog/vim-easymotion'
Bundle 'wesQ3/vim-windowswap'
Bundle 'Lokaltog/powerline'

"Bundle 'myusuf3/numbers.vim'
Bundle 'bling/vim-airline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'ludovicchabant/vim-lawrencium'

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
Bundle 'tpope/vim-dispatch'
Bundle 'nosami/Omnisharp'

set showcmd
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set ignorecase
set smartcase
set number
set incsearch
set autowrite
set t_Co=256
set autoread
set nohlsearch
set splitright splitbelow

" Incremental search as you type
set incsearch

" Highlight search matches
set hlsearch

" Make the mouse work
set mouse=a
  " make it work on the far right hand side of the screen
set ttymouse=sgr

syntax on


"~~~~~~~~~~VIM-AIRLINE~~~~~~~~~~"
"" Enable powerline fonts
let g:airline_powerline_fonts=1

" Set airline theme
let g:airline_theme="murmur"

" "Enable mercurial support
let g:airline_enable_lawrencium=1

" insert new lines from normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Turn on auto indenting for pasted code
set pastetoggle=<F2>

filetype plugin indent on

" use silver searcher for grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" block cursor in normal mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"set cursorline
"augroup CursorLine
    "au!
    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    "au WinLeave * setlocal nocursorline
"augroup END

" no current line highlight
hi clear CursorLine
augroup CLClear
  autocmd! ColorScheme * hi clear CursorLine
augroup END

" highlight current line number
hi CursorLineNR cterm=bold ctermfg=Blue
augroup CLNRSet
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

" iterm2 os x
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" tmux
"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


map <silent> <C-s> :NERDTreeFind<CR>

augroup AutoReloadVimRC
  au!
  " automatically reload vimrc when it's saved
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

nnoremap <silent> <C-h> :vertical resize -5<cr>
nnoremap <silent> <C-l> :vertical resize +5<cr>

"~~~~~~~~~ULTISNIPS~~~~~~~~~~"
let g:UltiSnipsExpandTrigger="<c-j>"

" Formatting for ag searching
"let g:agprg="ag --smart-case --column"
