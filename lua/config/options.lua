-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Undercurl (fixed: removed stray ] from escape sequences)
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.updatetime = 50
vim.opt.linebreak = true
vim.opt.smoothscroll = true
vim.opt.splitkeep = "screen"
