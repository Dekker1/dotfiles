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
	use 'Konfekt/vim-sentence-chopper' -- "gw" to split using sentences
	-- UI
	use { -- Popup selection
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use 'folke/which-key.nvim'
	-- Appearance
	use 'folke/tokyonight.nvim' -- Theme
	use 'hoob3rt/lualine.nvim' -- Status line
	use { 'lukas-reineke/indent-blankline.nvim', branch="lua" } -- Add indentation guides even on blank lines
	-- Language Support
	use 'neovim/nvim-lspconfig' -- Configuration of LSP
	use 'hrsh7th/nvim-compe' -- Autocompletion plugin
	-- TODO:  use 'L3MON4D3/LuaSnip' -- Snippets
	use 'hrsh7th/vim-vsnip' -- Snippets
	use 'hrsh7th/vim-vsnip-integ'
	use 'rafamadriz/friendly-snippets' -- Snippet Definitions
end)

--- Core Functionality ---
require "core.appearance"
require "core.editor"
require "core.mappings"
require "core.options"
require "core.search"

--- Language Support ---
require "lang.lsp"
require "lang.completion"
require "lang.treesitter"

require "lang.c++"
require "lang.python"
require "lang.rust"
require "lang.zinc"
