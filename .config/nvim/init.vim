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

Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'

call plug#end()

set mouse+=a
set hidden

set undofile                 "undo after save
set undodir=$HOME/.vim/undo  "directory where the undo files will be stored

let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python"

let g:lightline = {
	\ 'colorscheme': 'wal',
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

set number relativenumber
set ts=4 sw=4
