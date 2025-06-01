-- Set mapleader and maplocalleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.swapfile = false

-- Set options using Lua style
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.history = 1000
vim.opt.autowrite = true
vim.opt.relativenumber = true
vim.opt.backspace = "2"
vim.opt.laststatus = 2
vim.opt.shiftround = true
vim.opt.showcmd = true
vim.opt.undofile = true
vim.opt.scrolloff = 10

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
