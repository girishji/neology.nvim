-- Some colors from https://github.com/ntk148v/komau.vim

local M = {}

-- Palette
local color = {
  neutral = {
    white         = "#F5EEE6",
    black         = "#222222",
    subtle_white  = "#ECDECE",
    lightest_gray = "#CCCCCC",
    lighter_gray  = "#a9a9a9",
    light_gray    = "#999999",
    medium_gray   = "#767676",
    dark_gray     = "#545454",
    darker_gray   = "#424242",
    darkest_gray  = "#303030",
    statusline1   = "#444658",
    statusline2   = "#161622",
    yellow        = "#FED442",
    pink          = "#ce626c",
    green         = "#22863A",
    red           = "#e8303d",
    orange        = "#E36209",
    blue          = "#005CC5",
  },
  bluish = {
    white         = "#e6ded6",
    black         = "#1e1e2e",
    -- subtle_white  = "#c9d2ef",
    subtle_white  = "#ddd7d1",
    lightest_gray = "#CCCCCC",
    -- lighter_gray     = "#a9a9a9",
    -- lighter_gray     = "#b8b0bc",
    lighter_gray  = "#c9d2ef", -- bluish
    light_gray    = "#999999",
    medium_gray   = "#8c92a5",
    dark_gray     = "#646c86",
    darker_gray   = "#484f63",
    darkest_gray  = "#282939",
    statusline1   = "#444658",
    statusline2   = "#161622",
    yellow        = "#f9e2af",
    pink          = "#ce626c",
    green         = "#93e2d5",
    red           = "#f38ba8",
    orange        = "#f3ae83",
    blue          = "#85aff5",
    purple        = "#c6a2f1",
  },
}

-- Aliases
M.theme = {
  dark = {
    norm  = color.bluish.subtle_white,
    -- fg    = color.bluish.white,
    fg    = color.bluish.subtle_white,
    bg    = color.bluish.black,
    mute1 = color.bluish.lightest_gray,
    mute2 = color.bluish.lighter_gray,
    mute3 = color.bluish.medium_gray,
    mute4 = color.bluish.dark_gray,
    mute5 = color.bluish.darker_gray,
    mute6 = color.bluish.darkest_gray,
  },
  light = {
    norm  = color.neutral.darkest_gray,
    fg    = color.neutral.black,
    bg    = color.neutral.white,
    mute1 = color.neutral.darkest_gray,
    mute2 = color.neutral.darker_gray,
    mute3 = color.neutral.medium_gray,
    mute4 = color.neutral.light_gray,
    mute5 = color.neutral.lighter_gray,
    mute6 = color.neutral.lightest_gray,
  },
}

function M.setup()
  return vim.tbl_extend('force', color.bluish, M.theme['dark'])
end

return M
