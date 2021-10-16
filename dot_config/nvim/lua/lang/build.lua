-- YABS
function conf_yabs()
	local c_tasks = {
		default_task = "build",
		tasks = {
			build = {
				command = "cmake --build build --config Debug",
				output = "quickfix",
			},
			build_rel = {
				command = "cmake --build build --config Release",
				output = "quickfix",
			},
			clean = {
				command = "cmake --build build --target clean",
				output = "quickfix",
			},
		}
	}
	require("yabs"):setup {
		languages = {
			cpp = c_tasks,
			c = c_tasks,
			rust =  {
				default_task = "build",
				tasks = {
					build = {
						command = "cargo build -q",
						output = "quickfix",
					},
					build_rel = {
						command = "cargo build -q --release",
						output = "quickfix",
					},
					clean = {
						command = "cargo clean",
						output = "quickfix",
					},
					run = {
						command = "cargo run",
						output = "quickfix",
					},
				}
			},
		},
		-- Default tasks
		tasks = {},
		opts = {
			output_types = {
				quickfix = {
					open_on_run = "always"
				}
			}
		},
	}
end

return { conf_yabs = conf_yabs }
