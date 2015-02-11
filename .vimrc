set nocompatible

syntax on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'rails.vim'
Bundle 'taglist.vim'

Bundle 'The-NERD-tree'
let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenVSplit='v'
Bundle 'The-NERD-Commenter'

Bundle 'godlygeek/tabular'

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

" if you use Vundle, load plugins:
Bundle 'ervandew/supertab'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


Bundle 'ludovicchabant/vim-lawrencium'

Bundle 'kien/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'tpope/vim-dispatch'
Bundle 'rking/ag.vim'

Bundle 'AndrewRadev/switch.vim'
nnoremap - :Switch<cr>

"Language autocompletion
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
Bundle 'zah/nimrod.vim'

Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath.git'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-leiningen'
Bundle 'vim-scripts/paredit.vim'
Bundle 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Bundle 'nosami/Omnisharp'
let g:Omnisharp_start_server = 0

Bundle 'heartsentwined/vim-emblem'

Bundle 'flazz/vim-colorschemes'

Bundle 'chrisbra/NrrwRgn'

Bundle 'sjl/gundo.vim'

set nf=octal,hex,alpha

set showcmd
set nobackup
set noswapfile
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

" Formatting for ag searching
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
nnoremap <Leader>f :Ag! <C-r><C-w> ~/eflex
nnoremap <Leader>F :Ag! <C-r><C-w> ~/eflex/webApp/app

" automatically reload vimrc when it's saved
augroup AutoReloadVimRC
  au!
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

nnoremap <Leader>q :bp\|bd #<CR>

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
  autocmd!

  "autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

   "show type information automatically when the cursor stops moving
  "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
  autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
  autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
  autocmd FileType cs nnoremap <leader>t  :OmniSharpFindType<cr>
  " Builds can also run asynchronously with vim-dispatch installed
  autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
  " automatic syntax check on events (TextChanged requires Vim 7.4)
  autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
  " Automatically add new cs files to the nearest project on save
  autocmd BufWritePost *.cs call OmniSharp#AddToProject()
augroup END
"rename with dialog
nnoremap <F2> :OmniSharpRename<cr>

autocmd BufRead,BufNewFile *.cs setlocal tabstop=4 shiftwidth=4 expandtab

" disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

:command! Pp %!python -m json.tool

" set vim to chdir for each file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
