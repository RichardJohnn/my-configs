set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'rails.vim'
Bundle 'taglist.vim'

Bundle 'The-NERD-tree'
let NERDTreeQuitOnOpen=1
Bundle 'The-NERD-Commenter'

Bundle 'vcscommand.vim'
Bundle 'project.tar.gz'
Bundle 'surround.vim'
Bundle 'scrooloose/syntastic'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'wting/rust.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'wesQ3/vim-windowswap'
Bundle 'Lokaltog/powerline'

Bundle 'bling/vim-airline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'ludovicchabant/vim-lawrencium'

Bundle 'kien/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'tpope/vim-dispatch'
Bundle 'rking/ag.vim'

"Language autocompletion
Bundle 'Valloric/YouCompleteMe'
Bundle 'JSON.vim'
Bundle 'cocoa.vim'
Bundle 'scala.vim'
Bundle 'Erlang-plugin-package'
Bundle 'Hackerpilot/Dscanner'
Bundle 'VimClojure'
Bundle 'haskell.vim'
Bundle 'checksyntax-B'
Bundle 'kchmck/vim-coffee-script'
Bundle 'noc7c9/vim-iced-coffee-script'
Bundle 'dbext.vim'
Bundle 'SQLComplete.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'go.vim'
Bundle 'adimit/prolog.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'nono/vim-handlebars'
Bundle 'applescript.vim'
Bundle 'kongo2002/fsharp-vim'
Bundle 'OrangeT/vim-csharp'
Bundle 'elixir-lang/vim-elixir'
Bundle 'tpope/vim-cucumber'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath.git'
Bundle 'tpope/vim-fireplace'

Bundle 'nosami/Omnisharp'
let g:Omnisharp_start_server = 0

Bundle 'heartsentwined/vim-emblem'

Bundle 'flazz/vim-colorschemes'

set showcmd
set nobackup
set noswapfile
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
set nohlsearch
set splitright splitbelow
set completeopt=menu,menuone
set history=1000
set undolevels=1000
set wrap lbr

colorscheme lodestone
"colorscheme summerfruit256

" autoreload
au FocusGained,BufEnter * :silent! !

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

autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

let g:agprg="ag --smart-case --column"

" use silver searcher for grep
if executable('ag')
  set grepprg=ag\ --nogroup
  let g:ctrlp_user_command = 'ag %s -S -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" use cmatch for ctrlp
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" block cursor in normal mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" no current line highlight
hi clear CursorLine
augroup CLClear
  autocmd! ColorScheme * hi clear CursorLine
augroup END

" highlight current line number
hi CursorLineNR cterm=bold
augroup CLNRSet
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

set cursorline

"  bracket highlights
hi MatchParen cterm=bold ctermbg=none ctermfg=blue

" iterm2 os x
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" tmux
"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" search replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" find word under cursor
nnoremap <Leader>f :Ag! <C-r><C-w> webApp/app

augroup AutoReloadVimRC
  au!
  " automatically reload vimrc when it's saved
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

nnoremap <silent> <C-l> :vertical resize +5<cr>
nnoremap <silent> <C-h> :vertical resize -5<cr>
nnoremap <silent> <C-k> :resize +5<cr>
nnoremap <silent> <C-j> :resize -5<cr>

nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
"nnoremap <esc> :noh<return><esc>

"Y to yank til end of line.. like C and D
:map Y y$

" Formatting for ag searching
"let g:agprg="ag --smart-case --column"

nnoremap <Leader>q :bp\|bd #<CR>


augroup omnisharp_commands
  autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
  autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
  autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
  autocmd FileType cs nnoremap <leader>t  :OmniSharpFindType<cr>
augroup END
"rename with dialog
nnoremap <F2> :OmniSharpRename<cr>
