-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap= true, expr = true, silent = true })

-- Editing
	-- Wrap current paragraph
vim.api.nvim_set_keymap('n', '<M-q>', [[gwip]], { noremap = false })

-- Windows
vim.api.nvim_set_keymap('n', '<leader>w', [[<C-w>]], { noremap = true })

-- Define leader mappings (using which-key)
local whichkey = require("which-key")
whichkey.setup{}
local mappings = {
	["<tab>"] = { "<C-^>", "Reopen Last Buffer" },
	-- Buffer
	b = {
		name = "buffer",
		b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Find Buffer" },
		d = { "<cmd>bd<cr>", "Delete Buffer" },
		m = { "<cmd>%bd|e#<cr>", "Delete Other Buffers" },
		y = { "ggyG<C-o>", "Copy Buffer" },
	},
	-- File
	f = {
		name = "File",
		f = { "<cmd>lua require('telescope.builtin').file_browser()<cr>", "Find File" },
		s = { "<cmd>write<cr>", "Store File" },
		S = { "<cmd>wa<cr>", "Store All Files" },
	},
	-- Search
	s = {
		name = "Search",
		p = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Search Project" },
		b = { "<cmd>lua require('telescope.builtin').treesitter()<cr>", "Search Buffer Symbols" },
	},
	-- Project
	p = {
		f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Search Project" },
		b = { "<cmd>lua require('yabs'):run_default_task()<cr>", "Build Project" },
		t = { "<cmd>lua require('telescope').extensions.yabs.tasks()<cr>", "Search Project" },
	},

	-- Window
	q = { 
		name = "Quit",
		q = { "<cmd>qa<cr>", "Quit"},
	},
	w = "Window",
}
whichkey.register(mappings, { prefix = "<leader>" })
