local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local use = require('packer').use
require('packer').startup(function()
  -- Package manager (Self update)
  use 'wbthomason/packer.nvim'
  -- General Editing
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use { 'lukas-reineke/indent-blankline.nvim', branch="lua" } -- Add indentation guides even on blank lines
  -- UI
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} } -- Popup selection
  use 'joshdick/onedark.vim' -- Theme
  use 'itchyny/lightline.vim' -- Statusline
  -- LSP integration
  use 'neovim/nvim-lspconfig' -- Configuration of LSP
  use 'hrsh7th/nvim-compe' -- Autocompletion plugin
end)

--- Core Functionality ---
require "core.options"
require "core.search"
require "core.appearance"

--- Language Support ---
require "lang.lsp"
require "lang.completion"

require "lang.c++"
require "lang.python"
require "lang.rust"
