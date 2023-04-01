local M = {}

-- Palette
local colors = {
  intense_black = "#191919",
  black         = "#222222",
  medium_gray   = "#767676",
  white         = "#F5EEE6",
  light_black   = "#424242",
  lighter_black = "#545454",
  subtle_black  = "#303030",
  light_gray    = "#999999",
  lighter_gray  = "#CCCCCC",
  lightest_gray = "#E5E5E5",
  subtle_white  = "#ECDECE",
  yellow        = "#FED442",
  pink          = "#ce626c",
  green         = "#22863A",
  red           = "#e8303d",
  orange        = "#E36209",
  blue          = "#005CC5",
}

M.theme = {
  dark = {
    fg                  = colors.white,
    bg                  = colors.black,
    bg_subtle           = colors.light_gray,
    bg_med_subtle       = colors.lighter_black,
    bg_very_subtle      = colors.light_black,
    bg_very_very_subtle = colors.subtle_black,
    bg_intense          = colors.intense_black,
    text                = colors.subtle_white,
    norm                = colors.lighter_gray,
    norm_subtle         = colors.light_gray,
    cursorlinenr        = colors.white,
  },
  light = {
    fg                  = colors.black,
    bg                  = colors.white,
    bg_subtle           = colors.light_gray,
    bg_med_subtle       = colors.light_gray,
    bg_very_subtle      = colors.lightest_gray,
    bg_very_very_subtle = colors.lightest_gray,
    bg_intense          = colors.white,
    text                = colors.subtle_black,
    norm                = colors.light_black,
    norm_subtle         = colors.medium_gray,
    cursorlinenr        = colors.black,
  },
}

function M.setup(opts)
  local palette = {}
  if opts and opts.theme == 'light' then
    palette = vim.tbl_extend('force', colors, M.theme['light'])
  else
    palette = vim.tbl_extend('force', colors, M.theme['dark'])
  end
  return palette
end

return M
