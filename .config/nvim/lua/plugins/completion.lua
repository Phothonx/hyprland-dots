return {

	{ "hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "onsails/lspkind.nvim",
        },
		opts = {},
		config = function ()
			vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

			local cmp = require('cmp')
			local luasnip = require('luasnip')
			local select_opts = {behavior = cmp.SelectBehavior.Select}
            local lspkind = require('lspkind')

			vim.cmd(":set pumheight=10")
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				sources = {
					{name = 'path', keyword_length = 3},
					{name = 'nvim_lsp', keyword_length = 1},
					{name = 'buffer', keyword_length = 2},
					{name = 'luasnip', keyword_length = 3},
				},
				window = {
					documentation = cmp.config.window.bordered()
				},
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 25,
                        mode = "symbol_text",
                        menu = ({
                            buffer = "[Buffer]",
                            path = "[Path]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                        })
                    })
				},

				mapping = {
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<Up>'] = cmp.mapping.select_prev_item(select_opts),
					['<Down>'] = cmp.mapping.select_next_item(select_opts),

					['<Tab>'] = cmp.mapping(function(fallback)
						local col = vim.fn.col('.') - 1
						if cmp.visible() then
    						cmp.select_next_item(select_opts)
						elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
							fallback()
						else
							cmp.complete()
						end
					end, {'i', 's'}),

					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item(select_opts)
						else
							fallback()
						end
					end, {'i', 's'}),
				}
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
    			mapping = cmp.mapping.preset.cmdline(),
    			sources = {
    				{ name = 'buffer' }
    			}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
						{ name = 'path' }
					}, {
						{ name = 'cmdline' }
				})
			})

            -- If you want insert `(` after select function or method item
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )

		end,
        },


	{ "windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
		},
		config = function (_, opts)
			require("nvim-autopairs").setup(opts)
		end
	},

}
