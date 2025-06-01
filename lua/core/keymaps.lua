local keymap = vim.keymap

keymap.set("i", "jj", "<Esc>")
keymap.set("v", "jk", "<Esc>")
keymap.set("n", "<C-s>", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap.set("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>")
