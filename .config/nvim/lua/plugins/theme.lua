return {

	{ "catppuccin/nvim",
		priority = 1000,
		lazy = false,
		opts = {
			flavour = "mocha",
			transparent_background = false,
			styles = {
				operators = { "bold" },
			},
			integrations = {
        		treesitter = true,
				cmp = true,
				dashboard = true,
				mason = true,
				notify = true,
				nvimtree = true,
				which_key = false,
				indent_blankline = {
    				enabled = true,
    				scope_color = "lavender",
					colored_indent_levels = false,
				},
			}
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme "catppuccin"
		end
	},


	{ "nvim-tree/nvim-web-devicons",
		lazy = false,
		opts = {
			default = true,
			color_icons = true,
		},
		config = function (_, opts)
			require("nvim-web-devicons").setup(opts)
		end
	},


	{ "nvim-lualine/lualine.nvim",
		lazy = false,
		opts = {
			options = {
    			theme = "catppuccin",
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' }
			},
			globalstatus = true,
		},
		config = function (_, opts)
			vim.cmd("set laststatus =3")
			require('lualine').setup(opts)
		end
	},
}
