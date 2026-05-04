require("options")
require("config.lazy")
require("plugin.floaterminal")
require("plugin.dottello")

-- executin lua file, or line
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")



vim.keymap.set("n", "<leader>w", ":write<CR>")


--quick fix list hot keys
vim.keymap.set("n", "<leader>co", ":copen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ck", ":cprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cj", ":cnext<CR>", { noremap = true, silent = true })
-- location list`
vim.keymap.set("n", "<leader>lk", ":lbelow<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lj", ":labove<CR>", { noremap = true, silent = true })
-- resizing window 
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
	  vim.hl.on_yank()
	end,
})
