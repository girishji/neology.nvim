local options = require("neology").options
local colors = require("neology.colors").setup(options)

local M = {}

local c = {
  copper = "#7b4e32",
  green = "#255244",
  silver = "#957e5f",
  magenta = "#903a59",
  yellow = "#7d7600",
}

M.normal = {
  a = { bg = c.green, fg = colors.norm, gui = 'bold' },
  b = { bg = colors.bg_very_subtle, fg = colors.norm },
  c = { bg = colors.bg, fg = colors.norm_subtle },
  x = { bg = colors.bg_very_very_subtle, fg = colors.norm_subtle },
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
  a = { bg = colors.bg, fg = colors.bg_med_subtle },
  b = { bg = colors.bg, fg = colors.bg_med_subtle, gui = 'bold' },
  c = { bg = colors.bg, fg = colors.bg_med_subtle },
}

return M
