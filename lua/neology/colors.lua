-- Color picker and UI design guides:
--   https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors
--   https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors
--   https://m2.material.io/inline-tools/color/

local M = {}

-- Palette
local palette = {
  basic_colors = {
    -- choose 200 saturation for text and >400 for background (statusline)
    fg_red    = '#F48FB1',
    fg_yellow = '#FFF59D',
    bg_yellow = '#827717',
    fg_green  = '#80cbc4',
    bg_green  = '#4CAF50',
    bg_purple = '#9C27B0',
    bg_blue   = '#03A9F4',
  },
  default = {
    bg = {
      bg = '#0a1930',
      bg_overlay0 = '#19243b', -- cursorline --172135
      bg_overlay1 = '#1a2947',
      bg_overlay2 = '#2a426a',
      bg_primary = '#007e65',
    },
    fg = {
      fg = '#E0E0E0',
      '#e7eef9',
      fg_overlay1 = '#BDBDBD',
      fg_overlay2 = '#BDBDBD',
      fg_overlay3 = '#757575',
      fg_overlay4 = '#757575',
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
      bg_primary = '#007e65',
    },
    fg = {
      fg = '#e7eef9',
      fg_overlay1 = '#a8b8ca',
      fg_overlay2 = '#a8b8ca',
      fg_overlay3 = '#70879f',
      fg_overlay4 = '#70879f',
      fg_overlay5 = '#4b647c',
      fg_primary = '#7AC5B5',
    },
  },
  --
  cool_gray = {
    bg = {
      bg = '#1c2025',          -- bg color : overlay #121212 with font color at 8% opacity
      bg_overlay0 = "#272d35", --cursorline
      bg_overlay1 = '#1f2933',
      bg_overlay2 = '#323f4b',
      bg_primary = '#e9c9a8',
    },
    fg = {
      fg = '#f5f7fa',
      fg_overlay1 = '#cbd2d9',
      fg_overlay2 = '#cbd2d9',
      fg_overlay3 = '#7b8794',
      fg_overlay4 = '#7b8794',
      fg_overlay5 = '#52606d',
      fg_primary = '#7AC5B5',
    },
  },
  -- saturation = {
  --   '#f5f7fa',
  --   '#e4e7eb',
  --   '#cbd2d9',
  --   '#9aa5b1',
  --   '#7b8794',
  --   '#616e7c',
  --   '#52606d',
  --   '#3e4c59',
  --   '#323f4b',
  --   '#1f2933',
  -- },
  -- bg = '#1c2025', -- bg color : overlay #121212 with font color at 8% opacity
  -- cursorline = "#272d35",
  -- -- bg = '#1e1e2e',
  -- -- cursorline = "#282939",
  -- statusline1 = "#444658",
  -- statusline2 = "#161622",
  -- secondary = '#62d0bf',
  -- },
  warm_gray = {
    bg = {
      bg = '#241f1d',
      bg_overlay0 = "#2D2920",
      bg_overlay1 = '#27241d',
      bg_overlay2 = '#423d33',
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
    -- saturation = {
    --   '#faf9f7',
    --   '#e8e6e1',
    --   '#d3cec4',
    --   '#b8b2a7',
    --   '#a39e93',
    --   '#857f72',
    --   '#625d52',
    --   '#504a40',
    --   '#423d33',
    --   '#27241d',
    -- },
    -- bg = '#241f1d',
    -- cursorline = "#2D2920",
    -- statusline1 = "#423d33",
    -- statusline2 = "#363229",
    -- primary = '#e8a0b9',
    -- secondary = '#62cfbe',
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


-- -- Palette
-- local color = {
--   neutral = {
--     white         = "#F5EEE6",
--     black         = "#222222",
--     subtle_white  = "#ECDECE",
--     lightest_gray = "#CCCCCC",
--     lighter_gray  = "#a9a9a9",
--     light_gray    = "#999999",
--     medium_gray   = "#767676",
--     dark_gray     = "#545454",
--     darker_gray   = "#424242",
--     darkest_gray  = "#303030",
--     statusline1   = "#444658",
--     statusline2   = "#161622",
--     yellow        = "#FED442",
--     pink          = "#ce626c",
--     green         = "#22863A",
--     red           = "#e8303d",
--     orange        = "#E36209",
--     blue          = "#005CC5",
--   },
--   bluish = {
--     white         = "#e6ded6",
--     black         = "#1e1e2e",
--     -- subtle_white  = "#c9d2ef",
--     subtle_white  = "#ddd7d1",
--     -- subtle_white  = "#ddd7d1",
--     lightest_gray = "#CCCCCC",
--     lighter_gray  = "#c9d2ef", -- bluish
--     light_gray    = "#9197ab",
--     medium_gray   = "#8c92a5",
--     dark_gray     = "#646c86",
--     darker_gray   = "#484f63",
--     darkest_gray  = "#282939",
--     statusline1   = "#444658",
--     statusline2   = "#161622",
--     yellow        = "#f9e2af",
--     pink          = "#ce626c",
--     green         = "#93e2d5",
--     red           = "#f38ba8",
--     orange        = "#f3ae83",
--     blue          = "#85aff5",
--     purple        = "#c6a2f1",
--   },
-- }

-- local get_theme_colors = function(hue)
--   local c = hue == 'neutral' and color.neutral or color.bluish
--   local theme_colors = {
--     norm  = c.subtle_white,
--     -- fg    = c.white,
--     fg    = c.subtle_white,
--     bg    = c.black,
--     mute1 = c.lightest_gray,
--     mute2 = c.lighter_gray,
--     mute3 = c.medium_gray,
--     mute4 = c.dark_gray,
--     mute5 = c.darker_gray,
--     mute6 = c.darkest_gray,
--   }
--   return theme_colors
-- end


function M.setup()
  -- return get_palette('default')
  local theme = 'default'
  -- local theme = 'blue_gray'
  -- local theme = 'warm_gray'
  -- local theme = 'cool_gray'
  local colors = vim.tbl_extend('force', {}, palette.basic_colors)
  colors = vim.tbl_extend('force', colors, palette[theme].fg)
  colors = vim.tbl_extend('force', colors, palette[theme].bg)
  return colors
end

return M
