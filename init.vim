call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'dyng/ctrlsf.vim'
Plug 'dense-analysis/ale'
Plug 'flazz/vim-colorschemes'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
call plug#end()

set ignorecase
set infercase
set smartcase

set number

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

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"ctrl-p
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=45
let g:ctrlp_switch_buffer = 'et'

" Formatting for ag searching
"let g:ag_prg="ag --smart-case --column"
" start searching from your project root instead of the cwd
"let g:ag_working_path_mode='r'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" use cmatch for ctrlp
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
"let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
"let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}

" use silver searcher for grep
"if executable('ag')
  "set grepprg=ag\ --nogroup
  "let g:ctrlp_user_command = 'ag %s -S -l --nocolor -g ""'
  "let g:ctrlp_use_caching = 0
"endif

if executable('rg')
  set grepprg=rg\ --vimgrep
  let g:ctrlp_user_command = 'rg --files  %s'
endif

let g:rg_derive_root = 'true'

let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\'


" insert new lines from normal mode
nmap <CR> o<Esc>

" insert space from normal mode
nmap <space> a<space><Esc>h

" console.log the Word under your cursor above
nnoremap <Leader>k  "zyiWOconsole.log("<C-r>z", <C-r>z);<Esc>
" below
nnoremap K "zyiWoconsole.log("<C-r>z", <C-r>z);<Esc>

" close file but keep buffer open
nnoremap <Leader>q :bp\|bd #<CR>

" search replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"Y to yank til end of line.. like C and D
map Y y$

nnoremap <F1> <nop>
nnoremap Q <nop>

nnoremap <silent> <C-l> :vertical resize +5<cr>
nnoremap <silent> <C-h> :vertical resize -5<cr>
nnoremap <silent> <C-k> :resize +5<cr>
nnoremap <silent> <C-j> :resize -5<cr>

"remove highlight
nnoremap <leader><space> :nohlsearch<CR>

" Open files located in the same dir in with the current file is edited
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"CtrlSF -----------------------------------------
nmap     <leader>f <Plug>CtrlSFPrompt

let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

"--------------------------------------------------

colorscheme lodestone
