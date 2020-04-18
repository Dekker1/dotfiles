
""" Load plugins
call plug#begin(stdpath('data') . '/plugged')

""" Appearance plugins
Plug 'andreypopp/vim-colors-plain'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

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
" Colour scheme
set termguicolors
colorscheme plain

" Vi options
syntax on

" Keybindings
:let mapleader = " "
:nnoremap <silent> <leader>lg :LazyGit<CR>

" Line numbers
set relativenumber
set numberwidth=1

" Change default filling characters
set fillchars=eob:\ ,vert:\│

""" Functionality
" Language Servers
set omnifunc=v:lua.vim.lsp.omnifunc

""" Languages
" Rust
lua require'nvim_lsp'.rust_analyzer.setup{}
let g:rustfmt_autosave = 1
" Python
lua require'nvim_lsp'.pyls.setup{}

""" Load other configuration parts
execute 'source ' . stdpath('config') . '/statusline.vim'
