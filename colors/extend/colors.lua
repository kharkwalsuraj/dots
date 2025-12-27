local M = {}

M.base_30 = {
  white = "${onSurface}",
  black = "${surface}",
  darker_black = "${surface}",
  black2 = "${surfaceContainerHighest}",
  one_bg = "${surfaceContainer}",
  one_bg2 = "${surfaceContainerHigh}",
  one_bg3 = "${surfaceContainerHighest}",
  grey = "${outline}",
  grey_fg = "${onSurfaceVariant}",
  grey_fg2 = "${outlineVariant}",
  light_grey = "${surfaceVariant}",
  red = "${error}",
  baby_pink = "${errorContainer}",
  pink = "${term9}",
  line = "${surfaceContainerHigh}",
  green = "${term2}",
  vibrant_green = "${term10}",
  nord_blue = "${term12}",
  blue = "${term4}",
  seablue = "${term6}",
  yellow = "${term11}",
  sun = "${term3}",
  purple = "${term5}",
  dark_purple = "${term13}",
  teal = "${term14}",
  orange = "${term3}",
  cyan = "${term6}",
  statusline_bg = "${surfaceContainer}",
  lightbg = "${surfaceContainerHigh}",
  pmenu_bg = "${primary}",
  folder_bg = "${primary}",
}

M.base_16 = {
  base00 = "${term0}",
  base01 = "${term1}",
  base02 = "${surfaceContainerHighest}",
  base03 = "${term3}",
  base04 = "${term4}",
  base05 = "${term5}",
  base06 = "${term6}",
  base07 = "${term7}",
  base08 = "${term8}",
  base09 = "${term9}",
  base0A = "${term10}",
  base0B = "${term11}",
  base0C = "${term12}",
  base0D = "${term13}",
  base0E = "${term14}",
  base0F = "${term15}",
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
      fg = "${tertiary}",
    },
  },
  treesitter = {
    ["@comment"] = {
      fg = M.base_16.base03,
    },
    ["@string"] = {
      fg = "${tertiary}",
    },
  },
}

return M
