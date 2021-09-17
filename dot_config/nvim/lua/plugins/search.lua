-- Telescope
local conf_telescope = function()
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
end

return { conf_telescope = conf_telescope }