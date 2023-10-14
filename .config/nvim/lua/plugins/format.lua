return {

	{ "lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = {
				enabled = false,
			},
			exclude = {
				filetypes = { "dashboard", },
			},
		},
		config = function (_, opts)
			require("ibl").setup(opts)
		end,
		lazy = false,
	},


	{ "nvim-treesitter/nvim-treesitter",
		lazy = false,
		opts = {
			ensure_installed = { "c", "lua", "python", "vim", "vimdoc", "query" },
			auto_install = true,
			highlight = {
    			enable = true,
				additional_vim_regex_highlighting = false,
			},
			  indent = {
				enable = true
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end
	},

}
