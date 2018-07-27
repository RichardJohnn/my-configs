filetype off

call plug#begin('~/.vim/plugged')
Plug 'rizzatti/dash.vim'

Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-leiningen'

Plug 'ctrlpvim/ctrlp.vim'
"Plug 'JazzCore/ctrlp-cmatcher'
Plug 'nixprime/cpsm', { 'do': 'env PY3=ON ./install.sh' }

Plug 'vim-scripts/The-NERD-tree'
let NERDQuitOnOpen=1
let NERDTreeMapOpenVSplit='v'
Plug 'vim-scripts/The-NERD-Commenter'

Plug 'godlygeek/tabular'
Plug 'wesQ3/vim-windowswap'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'ludovicchabant/vim-lawrencium'
Plug 'rking/ag.vim'
Plug 'gabesoft/vim-ags'
Plug 'AndrewRadev/switch.vim'
nnoremap - :Switch<cr>

"Language autocompletion
Plug 'kchmck/vim-coffee-script'
Plug 'w0rp/ale'
Plug 'wavded/vim-stylus'
"Plug 'adimit/prolog.vim'
Plug 'uarun/vim-protobuf'

Plug 'guns/vim-clojure-static'
"Plug 'vim-scripts/VimClojure'

Plug 'heartsentwined/vim-emblem'
Plug 'flazz/vim-colorschemes'
Plug 'chrisbra/NrrwRgn'
Plug 'djoshea/vim-autoread'

call plug#end()

set shell=bash\ -l

filetype plugin indent on
syntax on

set nf=octal,hex,alpha

set list

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
set infercase
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
set lazyredraw

"highlight ColorColumn ctermbg=236 guibg=#2c2d27
"let &colorcolumn=join(range(81,999),",")
"let &colorcolumn="80,".join(range(120,999),",")

"colorscheme desert
colorscheme lodestone
"colorscheme summerfruit256

" autoreload
"au FocusGained,BufEnter * :silent! !

" autoreload when file changes on disk
"set autoread

" Incremental search as you type
set incsearch

" Highlight search matches
set hlsearch

" Make the mouse work
set mouse=a
  " make it work on the far right hand side of the screen
"set ttymouse=sgr

"ctrl-p
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=45
let g:ctrlp_switch_buffer = 'et'

" Formatting for ag searching
let g:ag_prg="ag --smart-case --column"
" start searching from your project root instead of the cwd
let g:ag_working_path_mode='r'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" use cmatch for ctrlp
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" use silver searcher for grep
if executable('ag')
  set grepprg=ag\ --nogroup
  let g:ctrlp_user_command = 'ag %s -S -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

if executable('rg')
  set grepprg=rg\ --vimgrep
  let g:ctrlp_user_command = 'rg --files  %s'
endif

let g:rg_derive_root = 'true'

let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\'

" ~~~ light line ~~~
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'separator': { 'left': '|', 'right': '|' },
      \ 'subseparator': { 'left': '>', 'right': '>' }
      \ }

function! LightLineFilename()
  return expand('%')
endfunction

" insert new lines from normal mode
nmap <CR> o<Esc>

" indenting
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10

autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" block cursor in normal mode
"set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" current line stuff
set cursorline

"highlight current line number
hi CursorLineNR cterm=bold
augroup CLNRSet
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

"  bracket highlights
hi MatchParen cterm=bold ctermbg=none ctermfg=blue

" tmux
"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" search replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"remove highlight
nnoremap <leader><space> :nohlsearch<CR>

"fix fucked up tab issue
nnoremap <leader>t :set expandtab <bar> :retab<CR>

" find word under cursor
nnoremap <Leader>f  :Ag! <C-r><C-w>
nnoremap <Leader>F  :Ag! <C-r><C-w> /Users/rich/eflex/<C-Left><Left>
nnoremap <Leader>E  :Ag! <C-r><C-w> /Users/rich/eflex/webApp/app/**/*.emblem<C-Left><Left>
nnoremap <leader>ag :Ag!  /Users/rich/eflex/<C-Left><Left>

"automatically reload vimrc when it's saved
augroup AutoReloadVimRC
  au!
  au BufWritePost ~/.vimrc so ~/.vimrc
augroup END

nnoremap <silent> <C-l> :vertical resize +5<cr>
nnoremap <silent> <C-h> :vertical resize -5<cr>
nnoremap <silent> <C-k> :resize +5<cr>
nnoremap <silent> <C-j> :resize -5<cr>


"Y to yank til end of line.. like C and D
map Y y$

"disable command history
map q: :q

"save!
map :W :w

" close file but keep buffer open
nnoremap <Leader>q :bp\|bd #<CR>

" search for visually selected text
vnoremap // y/<C-R>"<CR>

" disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

:command! Pp %!python -m json.tool

"autochdir:
"autocmd BufEnter * silent! lcd %:p:h

" Open files located in the same dir in with the current file is edited
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <F1> <nop>
nnoremap Q <nop>
"nnoremap <silent> K <nop>

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

