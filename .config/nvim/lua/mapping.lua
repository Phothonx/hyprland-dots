----------------------------------------------------------------- MAPPING
vim.g.mapleader = ' '

vim.keymap.set('n', '<Leader>h', '<c-w>h', { desc = "Move to right window" })
vim.keymap.set('n', '<Leader>j', '<c-w>j', { desc = "Move to down window" })
vim.keymap.set('n', '<Leader>k', '<c-w>k', { desc = "Move to upper window" })
vim.keymap.set('n', '<Leader>l', '<c-w>l', { desc = "Move to left window" })
