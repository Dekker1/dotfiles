""" Load plugins
call plug#begin(stdpath('data') . '/plugged')

""" Appearance plugins
Plug 'Dekker1/vim-colors-plain'

Plug 'junegunn/goyo.vim'

""" Functionality
" Language Server
Plug 'neovim/nvim-lsp'
" Tools
Plug 'kdheepak/lazygit.vim'  " Add LazyGit integration
Plug 'tpope/vim-commentary'  " comment using gc keybinding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'      " Add fuzzy file/line/everything searcher

""" Languages
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'pest-parser/pest.vim', { 'for': 'pest' }

call plug#end()

""" Appearance
" Vi options
set termguicolors
syntax on

set laststatus=2                       " enable statusbar
set tabstop=2
set shiftwidth=2
set expandtab

" Colour scheme
set background=dark
colorscheme plain

" Colour additions
highlight cursorlinenr term=bold ctermfg=1 ctermbg=NONE
highlight matchparen ctermbg=0 ctermfg=NONE

""" Keybindings
let mapleader = "\<space>"

" Buffers
" Switch to previous buffer
nnoremap <leader><tab> <C-^>
" Select from open buffers using FZF
nnoremap <leader>bb :Buffers<CR>
" Unload current buffer
nnoremap <leader>bd :bd<CR>
" Kill all other buffers
nnoremap <leader>bm :%bd\|e#<CR>
" Copy buffer to Clipboard
nnoremap <leader>by ggyG<C-o>

" Files
" Delete current file
fun! DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file?", "&Yes\n&No", 1)
  if choice == 1 | call delete(expand('%:p')) | endif
endfun
nnoremap <leader>fd :call DeleteFileAndCloseBuffer()<CR>
" Open file using FZF
nnoremap <leader>ff :Files<CR>
" Search file content in current directory
nnoremap <leader>fg :Rg 
" Save current file
nnoremap <leader>fs :w<CR>
" Save all files
nnoremap <leader>fS :wa<CR>
" Copy file path to clipboard
nnoremap <leader>fy :let @+ = expand('%:p')<cr>

" Git / Version control
nnoremap <silent> <leader>g :LazyGit<CR>

" Window control
nnoremap <leader>w <C-w>

" Jumping
nnoremap <silent> <leader>jb <C-o>
nnoremap <silent> <leader>jd <cmd>lua vim.lsp.buf.definition()<CR>

""" Functionality
" Vi behaviour
set encoding=utf-8
set clipboard+=unnamedplus " Use system clipboard
set autowriteall " Save modified files before changing buffer or closing window
au FocusLost * silent! wa " Save file when Vi loses focus

" Search
set ignorecase
set smartcase

" Line numbers
set number relativenumber
set numberwidth=1

" Spelling checker
set spell
set spellcapcheck=                            " Don't check for capital letters at the start of sentence
set spelllang=en,nl
" Change default filling characters
set fillchars=eob:\ ,vert:\│
set list
set listchars=tab:\│\ ,nbsp:␣,trail:·

" Backspace through anything
set backspace=indent,eol,start

" Paste will replace in visual mode
vnoremap p "_dP
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
