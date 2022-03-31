local treesitter = require('nvim-treesitter.parsers')
local parser_config = treesitter.get_parser_configs()
parser_config.minizinc = {
	install_info = {
		url = "https://github.com/shackle-rs/shackle",
		branch = "develop",
		files = {"src/parser.c"},
		location = "misc/tree-sitter-minizinc",
	},
	filetype = "zinc",
	used_by = {"mzn", "fzn", "dzn"}
}

vim.cmd('autocmd Filetype zinc setlocal commentstring=\\%\\ %s')
