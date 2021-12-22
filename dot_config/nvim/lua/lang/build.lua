-- YABS
function conf_yabs()
	require("yabs"):setup {
		languages = {
			cpp = {
				default_task = require("yabs").first_available("cmake_build", "make_build"),
			},
			c = {
				default_task = require("yabs").first_available("cmake_build", "make_build"),
			},
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
					test = {
						command = "cargo test",
						output = "quickfix",
					},
				}
			},
		},
		-- Default tasks
		tasks = {
			cmake_build = {
				command = "cmake --build build --config Debug",
				condition = require("yabs.conditions").file_exists("CMakeLists.txt"),
				output = "quickfix",
			},
			cmake_build_rel = {
				command = "cmake --build build --config Release",
				condition = require("yabs.conditions").file_exists("CMakeLists.txt"),
				output = "quickfix",
			},
			cmake_clean = {
				command = "cmake --build build --target clean",
				condition = require("yabs.conditions").file_exists("CMakeLists.txt"),
				output = "quickfix",
			},
			cmake_configure = {
				command = "cmake -B build -S .",
				condition = require("yabs.conditions").file_exists("CMakeLists.txt"),
				output = "quickfix",
			},
			make_build = {
				command = "make",
				condition = require("yabs.conditions").file_exists("Makefile"),
				output = "quickfix",
			},
			make_clean = {
				command = "make clean",
				condition = require("yabs.conditions").file_exists("Makefile"),
				output = "quickfix",
			},
			make_test = {
				command = "make test",
				condition = require("yabs.conditions").file_exists("Makefile"),
				output = "quickfix",
			},
		},
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
