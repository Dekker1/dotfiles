local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.api.nvim_command('packadd packer.nvim')
end

require('packer').startup(function()
	local use = require('packer').use
	-- Package manager (Self update)
	use 'wbthomason/packer.nvim'
	-- General Editing
	use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
	use 'Konfekt/vim-sentence-chopper' -- "gw" to split using sentences
	-- Appearance
	use 'folke/tokyonight.nvim' -- Theme
	use 'hoob3rt/lualine.nvim' -- Status line
	use { 'lukas-reineke/indent-blankline.nvim', branch="lua" } -- Add indentation guides even on blank lines
	use 'folke/which-key.nvim' -- Show key mappings
	-- Component: Language Server Protocol
	use 'neovim/nvim-lspconfig' -- Configuration of LSP
	-- Component: Tree Sitter Grammars
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- Component: Auto-completion
	use 'hrsh7th/nvim-compe' -- Autocompletion plugin
	use 'hrsh7th/vim-vsnip' -- Snippets
	use 'hrsh7th/vim-vsnip-integ'
			-- TODO:  use 'L3MON4D3/LuaSnip' -- Snippets
	-- Component: Popup Navigation/Search
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
end)

--- Core Functionality ---
require "core.appearance"
require "core.editor"
require "core.mappings"
require "core.options"
require "core.search"

--- Components ---
require "comp.lsp"
require "comp.completion"
require "comp.treesitter"

--- Language Support ---
require "lang.c++"
require "lang.python"
require "lang.rust"
require "lang.tex"
require "lang.zinc"
