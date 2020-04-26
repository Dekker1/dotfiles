
""" Load plugins
call plug#begin(stdpath('data') . '/plugged')

""" Appearance plugins
Plug 'andreypopp/vim-colors-plain'
Plug 'junegunn/goyo.vim'

""" Functionality
" Language Server
Plug 'neovim/nvim-lsp'
" Tools
Plug 'kdheepak/lazygit.vim'

""" Languages
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'pest-parser/pest.vim', { 'for': 'pest' }

call plug#end()

""" Appearance
" Vi options
set termguicolors
syntax on

set tabstop=2
set shiftwidth=2
set expandtab

" Colour scheme
colorscheme plain

" Vi options
syntax on

" Keybindings
:let mapleader = " "
:nnoremap <silent> <leader>lg :LazyGit<CR>

" Line numbers
set number relativenumber
set numberwidth=1

" Change default filling characters
set fillchars=eob:\ ,vert:\│

""" Functionality
" Vi behaviour
set clipboard+=unnamedplus " Use system clipboard
set autowriteall " Save modified files before changing buffer or closing window
au FocusLost * silent! wa " Save file when Vi loses focus

" Language Servers
set omnifunc=v:lua.vim.lsp.omnifunc

""" Languages
" Rust
lua require'nvim_lsp'.rust_analyzer.setup{}
let g:rustfmt_autosave = 1
autocmd Filetype rust setlocal tabstop=4 shiftwidth=4 expandtab

" Python
lua require'nvim_lsp'.pyls.setup{}
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 expandtab

" C/C++
lua require'nvim_lsp'.clangd.setup{}
autocmd Filetype c setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype cpp setlocal tabstop=2 shiftwidth=2 expandtab

""" Load other configuration parts
execute 'source ' . stdpath('config') . '/statusline.vim'
