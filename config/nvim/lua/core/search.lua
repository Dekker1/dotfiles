--Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

--Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  }
}
