require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
-- local demap = vim.keymap.del

map({ "n", "i", "v" }, "<M-j>", ":m .+1<CR>==", { noremap = true, silent = true })
map({ "n", "i", "v" }, "<M-k>", ":m .-2<CR>==", { noremap = true, silent = true })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map(
  "n",
  "<leader>ch",
  "<CMD>e ~/.local/share/nvim/lazy/NvChad/lua/nvchad/mappings.lua <CR>",
  { desc = "Real Cheatsheet" }
)
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
