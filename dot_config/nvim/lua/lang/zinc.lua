local treesitter = require('nvim-treesitter.parsers')
local parser_config = treesitter.get_parser_configs()
parser_config.minizinc = {
	install_info = {
		url = "https://github.com/Dekker1/tree-sitter-minizinc",
		branch = "develop",
		files = {"src/parser.c"}
	},
	filetype = "zinc",
	used_by = {"mzn", "fzn", "dzn"}
}

vim.cmd('autocmd Filetype zinc setlocal commentstring=\\%\\ %s')
