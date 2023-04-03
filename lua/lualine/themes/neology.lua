local options = require("neology").options
local colors = require("neology.colors").setup()

local M = {}

local c = {
  copper = "#7b4e32",
  green = "#255244",
  silver = "#957e5f",
  magenta = "#903a59",
  yellow = "#7d7600",
  blue = "#85aff5"
}

M.normal = {
  a = { bg = c.green, fg = colors.mute1, gui = 'bold' },
  b = { bg = colors.statusline1, fg = colors.mute1 },
  c = { bg = colors.statusline2, fg = colors.mute1 },
  -- y = { fg = colors.mute2, gui = 'italic' },
}

M.insert = {
  a = { bg = c.yellow, fg = colors.bg, gui = 'bold' },
}

M.command = {
  a = { bg = c.silver, fg = colors.bg, gui = 'bold' },
}

M.visual = {
  a = { bg = c.copper, fg = colors.bg, gui = 'bold' },
}

M.replace = {
  a = { bg = c.magenta, fg = colors.bg, gui = 'bold' },
}

M.terminal = {
  a = { bg = c.magenta, fg = colors.bg, gui = 'bold' },
}

-- inactive when there are split windows
M.inactive = {
  a = { bg = colors.bg, fg = colors.mute2 },
  b = { bg = colors.bg, fg = colors.mute2, gui = 'bold' },
  c = { bg = colors.bg, fg = colors.mute2 },
}

return M
