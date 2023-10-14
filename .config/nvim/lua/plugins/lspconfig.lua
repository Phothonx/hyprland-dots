return {

	{ "williamboman/mason.nvim",
		lazy = false,
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
        		},
			},
		},
		config = function (_, opts)
			require("mason").setup(opts)
		end
	},


	{ "Williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
            ensure_installed = { "clangd", "pyright", "lua_ls"},
            automatic_installation = true,
        },
		config = function (_,opts)
			require('mason-lspconfig').setup(opts)
		end
	},


	{ "neovim/nvim-lspconfig",
		lazy = false,
		opts = {},
		config = function ()
			local lspconfig = require('lspconfig')
			local lsp_defaults = lspconfig.util.default_config

			lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			lspconfig.lua_ls.setup({
				settings = {
        			Lua = {
            			diagnostics = {
                			globals = { 'vim' }
        				}
    				}
    			}
			})

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			lspconfig.pyright.setup({
				capabilities = capabilities
			})
			lspconfig.clangd.setup({
				capabilities = capabilities
			})
            lspconfig.ocamllsp.setup({
				capabilities = capabilities
			})

            local sign = function(opts)
            vim.fn.sign_define(opts.name, {
                texthl = opts.name,
                text = opts.text,
                numhl = ''
                })
            end

            sign({name = 'DiagnosticSignError', text = '✘'})
            sign({name = 'DiagnosticSignWarn', text = '▲'})
            sign({name = 'DiagnosticSignHint', text = '⚑'})
            sign({name = 'DiagnosticSignInfo', text = ''})

            vim.diagnostic.config({
                severity_sort = true,
                update_in_insert = false,
                signs = false,
                float = {
                    border = 'rounded',
                    source = 'always',
                },
            })

            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                vim.lsp.handlers.hover,
                {border = 'rounded'}
            )

            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
                vim.lsp.handlers.signature_help,
                {border = 'rounded'}
            )

		end
	},
}
