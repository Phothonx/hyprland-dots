return {

	{ "glepnir/dashboard-nvim",
		lazy = false,
		opts = {
			theme = 'doom',
			config = {
				disable_move = true,
				header = {
					"",
					"",
					"",
					"",
					"",
					"                                                                   ",
					"      ████ ██████           █████      ██                    ",
					"     ███████████             █████                            ",
					"     █████████ ███████████████████ ███   ███████████  ",
					"    █████████  ███    █████████████ █████ ██████████████  ",
					"   █████████ ██████████ █████████ █████ █████ ████ █████  ",
					" ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
					"██████  █████████████████████ ████ █████ █████ ████ ██████",
					"",
					"",
					"",
					"",
					"",
					"",
					"",
					"",
				},
				center = {
					{ icon = " ", key = "<leader>e", key_hl = "Number", desc = "Nvim tree", desc_hl = "Title", action = "NvimTreeToggle"},
            		{ icon = "󰒲 ", key = "<leader>lp", key_hl = 'Number', desc = "Plugins", desc_hl = 'Title', action = "Lazy" },
				},
				footer = {
					'',
					'',
    				'Startuptime: ' .. require('lazy').stats().startuptime .. ' ms',
    				'Plugins: '
					.. require("lazy").stats().loaded
    				.. ' loaded / '
    				.. require("lazy").stats().count
    				.. ' installed',
				},
			},
		},
		config = function (_, opts)
			require("dashboard").setup(opts)
		end
	},


	{ "nvim-tree/nvim-tree.lua",
		lazy = false,
		opts = {
			hijack_cursor = true,
			sort = {
				files_first = true,
			},
			view = {
				width = 29,
				centralize_selection = true,
			},
			renderer = {
				add_trailing = true,
				full_name = true,
				highlight_git = true,
				highlight_diagnostics = true,
				highlight_opened_files = "name",
				highlight_modified = "icon",
				indent_markers = {
					enable = true,
				},
			},
			filters = {
				dotfiles = true,
				git_ignored = false,
			},
			modified = {
				enable = true,
			},
			diagnostics = {
				enable = true
			},
			actions = {
				open_file = {
					quit_on_open = false,
				},
			},
		},
		config = function (_, opts)
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			require("nvim-tree").setup(opts)

			vim.api.nvim_create_autocmd({"QuitPre"}, {
    			callback = function() vim.cmd("NvimTreeClose") end,
			})

		end,
		keys = {
			{ '<leader>e', "<cmd>NvimTreeToggle<cr>", desc = "Toggle files tree"},
		},
	},


	{ "max397574/better-escape.nvim",
		lazy = false,
		opts = {
		    mapping = {"jk", "jj"},
		    timeout = vim.o.timeoutlen,
		    clear_empty_lines = true,
		    keys = "<Esc>",
		},
		config = function ()
			require("better_escape").setup()
		end
	},

}


