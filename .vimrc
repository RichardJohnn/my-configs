filetype off

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'

Plug 'kien/ctrlp.vim'
"Plug 'JazzCore/ctrlp-cmatcher'

Plug 'rails.vim'
Plug 'taglist.vim'

Plug 'The-NERD-tree'
let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenVSplit='v'
Plug 'The-NERD-Commenter'

Plug 'godlygeek/tabular'

Plug 'vcscommand.vim'
Plug 'project.tar.gz'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'scrooloose/syntastic'
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'
Plug 'wting/rust.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'wesQ3/vim-windowswap'
Plug 'Lokaltog/powerline'

Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'

" if you use Vundle, load plugins:
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Valloric/YouCompleteMe', {'do' : './install.sh --clang-completer --system-libclang' }
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

" coffeescript lint highlighting
let g:coffeeCheckHighlightErrorLine = 0

Plug 'ludovicchabant/vim-lawrencium'

Plug 'tpope/vim-dispatch'
Plug 'rking/ag.vim'

Plug 'AndrewRadev/switch.vim'
nnoremap - :Switch<cr>

"Language autocompletion
Plug 'JSON.vim'
Plug 'cocoa.vim'
Plug 'scala.vim'
Plug 'Erlang-plugin-package'
Plug 'Hackerpilot/Dscanner'
Plug 'VimClojure'
Plug 'haskell.vim'
Plug 'checksyntax-B'
Plug 'kchmck/vim-coffee-script'
Plug 'noc7c9/vim-iced-coffee-script'
Plug 'othree/coffee-check.vim'
Plug 'dbext.vim'
Plug 'SQLComplete.vim'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'myhere/vim-nodejs-complete'
Plug 'go.vim'
Plug 'adimit/prolog.vim'
Plug 'leafgarland/typescript-vim'
Plug 'nono/vim-handlebars'
Plug 'applescript.vim'
Plug 'kongo2002/fsharp-vim'
Plug 'OrangeT/vim-csharp'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-cucumber'
Plug 'zah/nimrod.vim'

Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-leiningen'
Plug 'vim-scripts/paredit.vim'
"Plug 'kien/rainbow_parentheses.vim'
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

Plug 'nosami/Omnisharp'
"let g:Omnisharp_start_server = 0

Plug 'heartsentwined/vim-emblem'

Plug 'flazz/vim-colorschemes'

Plug 'chrisbra/NrrwRgn'

Plug 'sjl/gundo.vim'

call plug#end()

filetype plugin indent on
syntax enable

set nf=octal,hex,alpha

set showcmd
set nobackup
set noswapfile

set autoindent
set smartindent
set tabstop=2
set smarttab
set shiftwidth=2
set shiftround
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
set wildmenu

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
"set ttymouse=sgr

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



autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" Formatting for ag searching
let g:ag_prg="ag --smart-case --column"

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" use cmatch for ctrlp
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" use silver searcher for grep
if executable('ag')
  set grepprg=ag\ --nogroup
  let g:ctrlp_user_command = 'ag %s -S -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip


" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" block cursor in normal mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" current line stuff
  "set cursorline

  " highlight current line number
  "hi CursorLineNR cterm=bold
  "augroup CLNRSet
    "autocmd! ColorScheme * hi CursorLineNR cterm=bold
  "augroup END

"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

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
nnoremap <Leader>e :Ag! <C-r><C-w> ~/eflex/webApp/app/**/*.emblem

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

"disable command history
map q: :q

"save!
map :W :w

" close file but keep buffer open
nnoremap <Leader>q :bp\|bd #<CR>

" search for visually selected text
vnoremap // y/<C-R>"<CR>
" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
  autocmd!

  "autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
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

autocmd FileType cs setlocal tabstop=4 shiftwidth=4 expandtab

" disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

:command! Pp %!python -m json.tool

" set vim to chdir for each file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\'
