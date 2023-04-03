-- Some colors from https://github.com/ntk148v/komau.vim

local M = {}

-- Palette
local color = {
  -- white            = "#F5EEE6",
  white            = "#e6ded6",
  black            = "#1e1e2e",
  -- black            = "#222222",
  subtle_white     = "#ECDECE",
  lightest_gray    = "#CCCCCC",
  lighter_gray     = "#a9a9a9",
  -- lighter_gray     = "#c9d2ef", -- bluish
  -- lighter_gray     = "#b8b0bc",
  light_gray       = "#999999",
  light_gray_beige = "#BFB3A3",
  medium_gray      = "#767676",
  dark_gray        = "#545454",
  darker_gray      = "#424242",
  -- darkest_gray     = "#303030",
  darkest_gray     = "#282939",
  statusline1      = "#444658",
  statusline2      = "#161622",
  yellow           = "#FED442",
  pink             = "#ce626c",
  green            = "#22863A",
  red              = "#e8303d",
  orange           = "#E36209",
  blue             = "#005CC5",
}

M.theme = {
  dark = {
    fg      = color.white,
    bg      = color.black,
    mute1   = color.lightest_gray,
    mute2   = color.lighter_gray,
    mute2_1 = color.light_gray_beige,
    mute3   = color.medium_gray,
    mute4   = color.dark_gray,
    mute5   = color.darker_gray,
    mute6   = color.darkest_gray,
  },
  light = {
    fg    = color.black,
    bg    = color.white,
    mute1 = color.darkest_gray,
    mute2 = color.darker_gray,
    mute3 = color.medium_gray,
    mute4 = color.light_gray,
    mute5 = color.lighter_gray,
    mute6 = color.lightest_gray,
  },
}

function M.setup(opts)
  local palette = {}
  if opts and opts.theme == 'light' then
    palette = vim.tbl_extend('force', color, M.theme['light'])
  else
    palette = vim.tbl_extend('force', color, M.theme['dark'])
  end
  return palette
  -- return M.theme[opts.theme]
end

return M
