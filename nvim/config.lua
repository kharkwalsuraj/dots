---- Conform.lua ----

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    sh = { "shfmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    rust = { "rustfmt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}
return options

---- LspConfig.lua ----

require("nvchad.configs.lspconfig").defaults()

local servers = {
  "lua_ls",
  "html",
  "cssls",
  "ts_ls",
  "pyright",
  "bashls",
  "clangd",
}
vim.lsp.enable(servers)

---- Chadrc.lua ----

--@type ChadrcConfig
local M = {}
M.base46 = {
  theme = "material-you",
  transparency = true,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  header = { "  󰥳  " },
  load_on_startup = true
}
M.ui = {
  tabufline = {
    lazyload = false,
    order = { "buffers", "tabs", "btns", "treeOffset" }
  }
}

return M


---- Mappings.lua ----

require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>ch", "<CMD>e ~/.local/share/nvim/lazy/NvChad/lua/nvchad/mappings.lua <CR>",
  { desc = "Goat's Cheatsheet" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree toggle window" })
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })

nomap("n", "<C-n>")
nomap({ "n", "v" }, "<leader>/")


nomap({ "n", "t" }, "<A-h>")
nomap({ "n", "t" }, "<A-v>")

map({ "n", "t" }, "<leader>v", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<leader>h", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

---- Plugins ----
---- Nvim-Tree ----
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      side = "right",
      width = 45,
    },
  },
}
