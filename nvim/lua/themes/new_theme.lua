local M = {}

M.base_30 = {
  white = "#E4E2E3",
  black = "#131314",
  darker_black = "#131314",
  black2 = "#343536",
  one_bg = "#1F2020",
  one_bg2 = "#292A2B",
  one_bg3 = "#343536",
  grey = "#919091",
  grey_fg = "#C7C6C7",
  grey_fg2 = "#464747",
  light_grey = "#464747",
  red = "#FFB4AB",
  baby_pink = "#93000A",
  pink = "#C6B6FF",
  line = "#292A2B",
  green = "#63E0CD",
  vibrant_green = "#F3FFFB",
  nord_blue = "#C0E3E9",
  blue = "#7AB3C6",
  seablue = "#80D8DB",
  yellow = "#FFFFFF",
  sun = "#7EFCD2",
  purple = "#9EA4EF",
  dark_purple = "#D8D6FF",
  teal = "#E6FFFE",
  orange = "#7EFCD2",
  cyan = "#80D8DB",
  statusline_bg = "#1F2020",
  lightbg = "#292A2B",
  pmenu_bg = "#BBC8D2",
  folder_bg = "#BBC8D2",
}

M.base_16 = {
  base00 = "#1A1B1B",
  base01 = "#967DFF",
  base02 = "#343536",
  base03 = "#7EFCD2",
  base04 = "#7AB3C6",
  base05 = "#9EA4EF",
  base06 = "#80D8DB",
  base07 = "#CDDCD4",
  base08 = "#B1BCB4",
  base09 = "#C6B6FF",
  base0A = "#F3FFFB",
  base0B = "#FFFFFF",
  base0C = "#C0E3E9",
  base0D = "#D8D6FF",
  base0E = "#E6FFFE",
  base0F = "#E0E3E8",
}

M.type = "dark"

M.polish_hl = {
  defaults = {
    Comment = {
      italic = true,
      fg = M.base_16.base03,
    },
  },
  Syntax = {
    String = {
      fg = "#B5C9D7",
    },
  },
  treesitter = {
    ["@comment"] = {
      fg = M.base_16.base03,
    },
    ["@string"] = {
      fg = "#B5C9D7",
    },
  },
}

return M
