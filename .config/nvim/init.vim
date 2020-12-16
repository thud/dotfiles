call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'dylanaraps/wal.vim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'OmniSharp/omnisharp-vim'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'evanleck/vim-svelte'
Plug 'thud/vim-and-cp'
Plug 'dag/vim-fish'

Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'

call plug#end()

let mapleader=" "
set mouse+=a
set hidden
set splitbelow

set number relativenumber
set ts=4 sw=4

set undofile                 "undo after save
set undodir=$HOME/.vim/undo  "directory where the undo files will be stored

let $PAGER='' "helping nvim for use as manpager

command W w " bind shift w to save
command Wq wq
command Q q
command WQ wq
set clipboard+=unnamedplus

let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python"

let g:lightline = {
	\ 'colorscheme': 'nord',
	\ }
set noshowmode
colorscheme wal

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }

" ncm config
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:OmniSharp_server_stdio = 1

let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'zathura'

au BufReadPost xmobarrc set ft=haskell

tnoremap <Esc> <C-\><C-n>
