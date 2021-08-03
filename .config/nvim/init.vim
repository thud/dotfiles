call plug#begin('~/.config/nvim/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'arcticicestudio/nord-vim'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-commentary'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'evanleck/vim-svelte'
Plug 'thud/vim-and-cp'
Plug 'dag/vim-fish'

Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'

call plug#end()

let mapleader="\<Space>"
set mouse+=a
set hidden
set splitbelow

syntax enable
filetype plugin indent on

set number relativenumber
set ts=4 sw=4
set expandtab

set undofile                 "undo after save
set undodir=$XDG_DATA_HOME/nvim/undo  "directory where the undo files will be stored

let $PAGER='' "helping nvim for use as manpager

command W w " bind shift w to save
command Wq wq
command Q q
command WQ wq
set clipboard+=unnamedplus

let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }
set noshowmode
colorscheme nord
set cc=80
set updatetime=100

highlight ColorColumn ctermbg=13
highlight TrailingWhitespace ctermbg=13
match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * redraw!

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'cpp', 'rust', 'toml', 'svelte', 'typescript', 'javascript', 'json', 'yaml', 'bash', 'html', 'css', 'python' } , -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },              -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'zathura'

let g:rooter_patterns = ['^template.cpp', '.git', 'Makefile']

tnoremap <Esc> <C-\><C-n>

map <leader>g :Goyo<CR>
map <leader>r :Rg<CR>
map <leader>a :wa<CR>:!npm<space>run<space>format<CR>

" FZF binds
map <leader>f :GFiles --exclude-standard --others --cached<CR>
nmap <leader>; :Buffers<CR>
