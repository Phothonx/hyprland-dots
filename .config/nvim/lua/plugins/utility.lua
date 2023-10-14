return {

	{ "folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
    		"MunifTanjim/nui.nvim",
    		"rcarriga/nvim-notify",
    	},
		opts = {
			lsp = {
			    override = {
			      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			      ["vim.lsp.util.stylize_markdown"] = true,
			      ["cmp.entry.get_documentation"] = true,
			    },
			  },
			  presets = {
			    bottom_search = true,
			    command_palette = true,
			    long_message_to_split = true,
			    inc_rename = false,
			    lsp_doc_border = false,
			  },
		},
		config = function (_, opts)
			require("noice").setup(opts)
		end
	},


	{ "folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
    		vim.o.timeout = true
    		vim.o.timeoutlen = 600
		end,
		opts = {
		},
	},


	{ "CRAG666/code_runner.nvim",
		opts = {
			filetype = {
				python = "python3 -u",
				c = {
					"cd $dir &&",
					"gcc -Wall -Wextra -std=c99 -Wpedantic -fsanitize=address,undefined,leak -g $fileName &&",
					"$dir/a.out",
				},
			},
		},
		config = function (_, opts)
			require("code_runner").setup(opts)
		end,
		keys = {
			{'<leader>r', '<cmd>RunCode<cr>', desc = "Run code" },
			{'<leader>rf', '<cmd>RunFile<cr>', desc = "Run file" },
		},
	},

	{ 'alec-gibson/nvim-tetris',
		keys = {
            {"<leader>tttt", "<cmd>Tetris<cr>", desc = "Tetris"},
        },
	},


	{ 'whonore/Coqtail',
		keys = {
			{"<leader>cc", "<cmd>CoqStart<cr>", desc = "Start Coq proof"},
		},
	},

	{'akinsho/toggleterm.nvim',
		version = "*",
		opts = {
			size = 12,
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			close_on_exit = false,
			shell = vim.o.shell,
		},
		config = function (_,opts)
			require("toggleterm").setup(opts)
		end,
		keys = {
			{"<leader>mt", "<cmd>ToggleTerm<cr>", desc = "Toggle Term"},
		},
	},


    { "ellisonleao/glow.nvim",
        opts = {
            style = "dark",
            width = 120,
            glow_path = "/usr/bin/glow",
        },
        config = function (_, opts)
            require("glow").setup(opts)
        end,
        cmd = "Glow",
    }
}
