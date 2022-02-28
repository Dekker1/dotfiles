-- DAP
function conf_debug()
	local dap = require('dap')
	dap.adapters.lldb = {
		type = 'executable',
		command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed
		name = "lldb"
	}
	dap.configurations.cpp = {
		{
			name = "Launch",
			type = "lldb",
			request = "launch",
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = {},
			runInTerminal = false,
		},
	}
	-- Use the same configuration for C and Rust
	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp

end

return { conf_debug = conf_debug }
