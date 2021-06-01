-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap= true, expr = true, silent = true })

-- Buffers
 -- Switch to previous buffer
vim.api.nvim_set_keymap('n', '<leader><tab>', [[<C-^>]], { noremap = true })
 -- Choose from open buffers
vim.api.nvim_set_keymap('n', '<leader>bb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true })
 -- Delete current buffer
vim.api.nvim_set_keymap('n', '<leader>bd', [[<cmd>bd<cr>]], { noremap = true })
 -- Delete all other buffers
vim.api.nvim_set_keymap('n', '<leader>bm', [[<cmd>%bd\|e#<cr>]], { noremap = true })
 -- Copy current buffer
vim.api.nvim_set_keymap('n', '<leader>by', [[ggyG<C-o>]], { noremap = true })

-- Editing
	-- Wrap current paragraph
vim.api.nvim_set_keymap('n', '<M-q>', [[gwip]], { noremap = false })


-- Files
  -- Open file
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
  -- Save curent file
vim.api.nvim_set_keymap('n', '<leader>fs', [[<cmd>write<cr>]], { noremap = true })
  -- Save all open files
vim.api.nvim_set_keymap('n', '<leader>fs', [[<cmd>wa<cr>]], { noremap = true })

-- Project
	-- Open file in project (pwd)
vim.api.nvim_set_keymap('n', '<leader>pf', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})

-- Search
  -- Search in current project
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
  -- Search word under cursor in current project
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
  -- Search symbols in current buffer
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').treesitter()<cr>]], { noremap = true, silent = true})

-- Windows
vim.api.nvim_set_keymap('n', '<leader>w', [[<C-w>]], { noremap = true })
  -- Quit all vim windows
vim.api.nvim_set_keymap('n', '<leader>qq', [[<cmd>qa<cr>]], { noremap = true })
