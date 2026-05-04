vim.g.mapleader = " "
vim.g.maplocalleader = "//"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.spelllang = "en-US"
vim.opt.winborder = "rounded"
vim.opt.scrolloff = 5
vim.opt.cmdheight = 1
vim.opt.history = 999
vim.opt.shada = "'2000,f1,<1000"
vim.opt.completeopt = { "menu", "menuone", "popup", "noselect", "fuzzy" }
vim.opt.updatetime = 300

vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  trail = "+",
  nbsp = "␣",
  extends = "⟩",
  precedes = "⟨",
}


vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o", "i" })
  end,
})
