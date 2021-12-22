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
	use {
		'numToStr/Comment.nvim', -- 'gc' to comment visual regions/lines
		config = function()
			require('Comment').setup()
		end
	}
	use {
		'Konfekt/vim-sentence-chopper', -- 'gw' to split using sentences
		config = function() vim.g.latexindent = false end, -- "gw" should not use latexindent
	}
	-- Appearance
	use {
		'cormacrelf/dark-notify', -- Automatic theme switching 
		requires = {
			'nvim-lualine/lualine.nvim', -- Status line
			'rose-pine/neovim', -- Theme
		},
		config = require('plugins.appearance').conf_theme,
	}
	use {
		'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
		config = require('plugins.appearance').conf_indent,
	}
	use {
		'folke/which-key.nvim', -- Show key mappings
		config = function() require('plugins.keymap') end,
	}
	use {
		"beauwilliams/focus.nvim",
		config = function() require("focus").setup() end,
	}
	-- Language configuration
	use {
		'neovim/nvim-lspconfig', -- Configuration of LSP
		requires = {
			{
				'nvim-treesitter/nvim-treesitter',
				run = ':TSUpdate',
				config = require('plugins.appearance').conf_treesitter,
			},
		},
		config = function()
			require('lang.c++')
			require('lang.go')
			require('lang.python')
			require('lang.rust')
			require('lang.tex')
			require('lang.yaml')
			require('lang.zinc')
		end,
	} 
	use {
		'pianocomposer321/yabs.nvim', -- Build System
		config = require('lang.build').conf_yabs,
	}
	-- Auto-completion
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			-- Sources
			'Saecki/crates.nvim',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/vim-vsnip',
			-- Further Requirements
			'nvim-lua/plenary.nvim'
		},
		config = require('plugins.completion').conf_cmp,
	}
	-- Component: Popup Navigation/Search
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', },
		config = require('plugins.search').conf_telescope,
	}
end)

---- Set general neovim options ----
require 'options'
