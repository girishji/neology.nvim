-- Color picker and UI design guides:
--   https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors
--   https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors
--   https://m2.material.io/inline-tools/color/
--   https://compilezero.medium.com/dark-mode-ui-design-the-definitive-guide-part-1-color-53dcfaea5129

local M = {}

-- Palette
local palette = {
  basic_colors = {
    -- choose 200 saturation for text and >400 for background (statusline)
    fg_red    = '#EF9A9A',
    fg_yellow = '#FFF59D',
    bg_yellow = '#F57F17',
    fg_green  = '#80cbc4',
    fg_orange = '#FFCC80',
    fg_brown  = '#BCAAA4',
    bg_brown  = '#4E342E',
    fg_purple = '#CE93D8',
    bg_purple = '#6A1B9A',
    fg_blue   = '#80DEEA',
    bg_blue   = '#006064',
    fg_gray   = '#B0BEC5',
    bg_gray   = '#455A64',
  },
  tricolor = {
    bg = {
      bg = '#1e1e2e',
      bg_overlay0 = "#282939", --cursorline
      bg_overlay1 = '#282939',
      bg_overlay2 = '#35364c',
      bg_overlay3 = '#4f5179',
      -- Bluish background
      -- bg = '#0a1930',
      -- bg_overlay0 = '#19243b', -- cursorline --172135
      -- bg_overlay1 = '#1a2947',
      -- bg_overlay2 = '#2a426a',
      -- bg_overlay3 = '#4c5773',
      bg_primary = '#007e65',
    },
    fg = {
      -- Bluish tones
      fg = '#ddd7d1',
      fg_overlay1 = '#c9d2ef',
      fg_overlay2 = '#9197ab',
      fg_overlay3 = '#8c92a5',
      -- fg_overlay4 = '#646c86',
      fg_overlay4 = '#484f63',
      fg_overlay5 = '#484f63',
      fg_primary = '#7AC5B5',
    },
  },
  --
  pure_gray = {
    bg = {
      bg = '#1e1e2e',
      bg_overlay0 = "#282939", --cursorline
      bg_overlay1 = '#282939',
      bg_overlay2 = '#35364c',
      bg_overlay3 = '#4f5179',
      bg_primary = '#007e65',
    },
    fg = {
      fg = '#e6ded6',
      fg_overlay1 = '#C5C5C5',
      fg_overlay2 = '#909090',
      fg_overlay3 = '#909090',
      fg_overlay4 = '#484f63',
      fg_overlay5 = '#424242',
      fg_primary = '#7AC5B5',
    },
  },
  --
  blue_gray = {
    bg = {
      bg = '#1e1e2e',
      bg_overlay0 = "#282939", --cursorline
      bg_overlay1 = '#263238',
      bg_overlay2 = '#37474F',
      bg_overlay3 = '#455A64',
      bg_primary = '#007e65',
    },
    fg = {
      fg = '#ddd7d1',
      fg_overlay1 = '#aab2cc',
      fg_overlay2 = '#aab2cc',
      -- fg_overlay1 = '#9da3ba',
      -- fg_overlay2 = '#9da3ba',
      fg_overlay3 = '#8c92a5',
      -- fg_overlay4 = '#646c86',
      fg_overlay4 = '#484f63',
      fg_overlay5 = '#484f63',
      fg_primary = '#7AC5B5',
      -- fg = '#e7eef9',
      -- fg_overlay1 = '#a8b8ca',
      -- fg_overlay2 = '#a8b8ca',
      -- fg_overlay3 = '#70879f',
      -- fg_overlay4 = '#70879f',
      -- fg_overlay5 = '#4b647c',
      -- fg_primary = '#7AC5B5',
    },
  },
  --
  cool_gray = {
    bg = {
      bg = '#1c2025',          -- bg color : overlay #121212 with font color at 8% opacity
      bg_overlay0 = "#272d35", --cursorline
      bg_overlay1 = '#1f2933',
      bg_overlay2 = '#323f4b',
      bg_overlay3 = '#3e4c59',
      -- bg_primary = '#e9c9a8',
      bg_primary = '#007e65',
    },
    fg = {
      fg = '#e4e7eb',
      fg_overlay1 = '#9aa5b1',
      fg_overlay2 = '#9aa5b1',
      fg_overlay3 = '#7b8794',
      fg_overlay4 = '#52606d',
      fg_overlay5 = '#52606d',
      fg_primary = '#7AC5B5',
    },
  },
  --
  warm_gray = {
    bg = {
      bg = '#241f1d',
      bg_overlay0 = "#2D2920",
      bg_overlay1 = '#27241d',
      bg_overlay2 = '#423d33',
      bg_overlay3 = '#504a40',
      bg_primary = '#bc456b',
    },
    fg = {
      fg = '#faf9f7',
      fg_overlay1 = '#d3cec4',
      fg_overlay2 = '#d3cec4',
      fg_overlay3 = '#a39e93',
      fg_overlay4 = '#a39e93',
      fg_overlay5 = '#625d52',
      fg_primary = '#e8a0b9',
    },
  },
}

local get_palette = function(hue)
  local c = palette[hue]
  local colors = {
    red         = '#F48FB1',
    yellow      = '#FFF59D',
    green       = '#80cbc4',
    purple      = '#CE93D8',
    blue        = '#9FA8DA',
    cursorline  = c.cursorline,
    statusline1 = c.statusline1,
    -- statusline2 = c.statusline2,
    statusline2 = c.bg,
    bg          = c.bg,
    fg          = c.saturation[1],
    bg_overlay1 = c.saturation[10],
    bg_overlay2 = c.saturation[9],
    bg_overlay3 = c.saturation[8],
    bg_overlay4 = c.saturation[7],
    fg_overlay1 = c.saturation[2],
    fg_overlay2 = c.saturation[3],
    fg_overlay3 = c.saturation[4],
    fg_overlay4 = c.saturation[5],
    fg_overlay5 = c.saturation[6],
  }
  colors = vim.tbl_extend('force', colors, c)
  colors.statusline2 = c.bg
  return colors
end


function M.setup()
  local theme = 'blue_gray'
  -- local theme = 'cool_gray'
  -- local theme = 'tricolor'
  -- local theme = 'warm_gray'
  local colors = vim.tbl_extend('force', {}, palette.basic_colors)
  colors = vim.tbl_extend('force', colors, palette[theme].fg)
  colors = vim.tbl_extend('force', colors, palette[theme].bg)
  return colors
end

return M
