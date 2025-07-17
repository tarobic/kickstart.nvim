-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		{
			"GustavEikaas/easy-dotnet.nvim",
			-- 'nvim-telescope/telescope.nvim' or 'ibhagwan/fzf-lua' or 'folke/snacks.nvim'
			-- are highly recommended for a better experience
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
			},
			config = function()
				local function get_secret_path(secret_guid)
					local path = ""
					local home_dir = vim.fn.expand "~"
					if require("easy-dotnet.extensions").isWindows() then
						local secret_path = home_dir
							.. "\\AppData\\Roaming\\Microsoft\\UserSecrets\\"
							.. secret_guid
							.. "\\secrets.json"
						path = secret_path
					else
						local secret_path = home_dir
							.. "/.microsoft/usersecrets/"
							.. secret_guid
							.. "/secrets.json"
						path = secret_path
					end
					return path
				end

				local dotnet = require "easy-dotnet"
				-- Options are not required
				dotnet.setup {
					--Optional function to return the path for the dotnet sdk (e.g C:/ProgramFiles/dotnet/sdk/8.0.0)
					-- easy-dotnet will resolve the path automatically if this argument is omitted, for a performance improvement you can add a function that returns a hardcoded string
					-- You should define this function to return a hardcoded path for a performance improvement 🚀
					get_sdk_path = get_sdk_path,
					---@type TestRunnerOptions
					test_runner = {
						---@type "split" | "vsplit" | "float" | "buf"
						viewmode = "float",
						---@type number|nil
						vsplit_width = nil,
						---@type string|nil "topleft" | "topright"
						vsplit_pos = nil,
						enable_buffer_test_execution = true, --Experimental, run tests directly from buffer
						noBuild = true,
						icons = {
							passed = "",
							skipped = "",
							failed = "",
							success = "",
							reload = "",
							test = "",
							sln = "󰘐",
							project = "󰘐",
							dir = "",
							package = "",
						},
						mappings = {
							run_test_from_buffer = {
								lhs = "<leader>r",
								desc = "run test from buffer",
							},
							filter_failed_tests = {
								lhs = "<leader>fe",
								desc = "filter failed tests",
							},
							debug_test = { lhs = "<leader>d", desc = "debug test" },
							go_to_file = { lhs = "g", desc = "go to file" },
							run_all = { lhs = "<leader>R", desc = "run all tests" },
							run = { lhs = "<leader>r", desc = "run test" },
							peek_stacktrace = {
								lhs = "<leader>p",
								desc = "peek stacktrace of failed test",
							},
							expand = { lhs = "o", desc = "expand" },
							expand_node = { lhs = "E", desc = "expand node" },
							expand_all = { lhs = "-", desc = "expand all" },
							collapse_all = { lhs = "W", desc = "collapse all" },
							close = { lhs = "q", desc = "close testrunner" },
							refresh_testrunner = {
								lhs = "<C-r>",
								desc = "refresh testrunner",
							},
						},
						--- Optional table of extra args e.g "--blame crash"
						additional_args = {},
					},
					new = {
						project = {
							prefix = "sln", -- "sln" | "none"
						},
					},
					---@param action "test" | "restore" | "build" | "run"
					terminal = function(path, action, args)
						local commands = {
							run = function()
								return string.format(
									"dotnet run --project %s %s",
									path,
									args
								)
							end,
							test = function()
								return string.format("dotnet test %s %s", path, args)
							end,
							restore = function()
								return string.format("dotnet restore %s %s", path, args)
							end,
							build = function()
								return string.format("dotnet build %s %s", path, args)
							end,
							watch = function()
								return string.format(
									"dotnet watch --project %s %s",
									path,
									args
								)
							end,
						}

						local command = commands[action]() .. "\r"
						vim.cmd "vsplit"
						vim.cmd("term " .. command)
					end,
					secrets = {
						path = get_secret_path,
					},
					csproj_mappings = true,
					fsproj_mappings = true,
					auto_bootstrap_namespace = {
						--block_scoped, file_scoped
						type = "block_scoped",
						enabled = true,
					},
					-- choose which picker to use with the plugin
					-- possible values are "telescope" | "fzf" | "snacks" | "basic"
					-- if no picker is specified, the plugin will determine
					-- the available one automatically with this priority:
					-- telescope -> fzf -> snacks ->  basic
					picker = "telescope",
					background_scanning = true,
					notifications = {
						--Set this to false if you have configured lualine to avoid double logging
						handler = function(start_event)
							local spinner =
								require("easy-dotnet.ui-modules.spinner").new()
							spinner:start_spinner(start_event.job.name)
							---@param finished_event JobEvent
							return function(finished_event)
								spinner:stop_spinner(
									finished_event.result.text,
									finished_event.result.level
								)
							end
						end,
					},
				}

				-- Example command
				vim.api.nvim_create_user_command("Secrets", function()
					dotnet.secrets()
				end, {})

				-- Example keybinding
				vim.keymap.set("n", "<C-p>", function()
					dotnet.run_project()
				end)
			end,
		},
	},
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- your configuration comes here; leave empty for default settings
		},
	},
}
