---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "new_theme",

  transparency = true,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = { load_on_startup = true, header = { " 󰥳 " } }
M.ui = {
  tabufline = {
    lazyload = false,
    order = { "buffers", "treeOffset" },
  },
  telescope = { style = "borderless" },
}

return M
