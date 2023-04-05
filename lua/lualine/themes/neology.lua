local c = require("neology.colors").setup()

local M = {}

M.normal = {
  a = { bg = c.bg_primary, fg = c.fg, gui = 'bold' },
  b = { bg = c.bg, fg = c.fg_primary },
  c = { bg = c.bg, fg = c.fg_overlay3 },
}

M.insert = {
  a = { bg = c.bg_yellow, fg = c.fg, gui = 'bold' },
}

M.command = {
  a = { bg = c.bg_purple, fg = c.fg, gui = 'bold' },
}

M.visual = {
  a = { bg = c.bg_green, fg = c.fg, gui = 'bold' },
}

M.replace = {
  a = { bg = c.bg_blue, fg = c.fg, gui = 'bold' },
}

M.terminal = {
  a = { bg = c.bg_green, fg = c.fg, gui = 'bold' },
}

-- inactive when there are split windows
M.inactive = {
  a = { bg = c.bg, fg = c.fg_overlay3 },
  b = { bg = c.bg, fg = c.fg_overlay3 },
  c = { bg = c.bg, fg = c.fg_overlay3 },
}

return M
