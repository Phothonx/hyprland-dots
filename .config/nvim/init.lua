

-- ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
-- ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
-- ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
-- ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
-- ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
-- ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝


----------------------------------------------------------------------- LAZY INSTALL
local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

-------------------------------------------------------------------- VIM CONFIG

vim.cmd("set shortmess=A")
vim.opt.number = true

vim.opt.cursorline = true

vim.opt.hlsearch = false

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd("set clipboard+=unnamedplus")

vim.opt.termguicolors = true

vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

vim.g.python_host_prog='/usr/bin/python3'


----------------------------------------------------------------- MAPPING

require("mapping")


------------------------------------------------------------------------ LAZY SETUP

function lazy.setup(plugins)
	if vim.g.plugins_ready then
    	return
	end
	-- You can "comment out" the line below after lazy.nvim is installed
	--lazy.install(lazy.path)
	vim.opt.rtp:prepend(lazy.path)
	require('lazy').setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {
	defaults = {
		lazy = true, -- should plugins be lazy-loaded?
	},
	install = {
		-- try to load one of these colorschemes when starting an installation during startup
		colorscheme = { "catppuccin" },
	},
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		frequency = 86400,
	},
}
lazy.setup("plugins")
