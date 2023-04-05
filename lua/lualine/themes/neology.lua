local c = require("neology.colors").setup()

local M = {}

M.normal = {
  a = { bg = c.bg_primary, fg = c.fg },
  b = { bg = c.bg, fg = c.fg_primary },
  c = { bg = c.bg, fg = c.fg_overlay2 },
}

M.insert = {
  a = { bg = c.bg_gray, fg = c.fg },
  b = { bg = c.bg, fg = c.fg_gray },
}

M.command = {
  a = { bg = c.bg_brown, fg = c.fg },
  b = { bg = c.bg, fg = c.fg_brown },
}

M.visual = {
  a = { bg = c.bg_purple, fg = c.fg },
  b = { bg = c.bg, fg = c.fg_purple },
}

M.replace = {
  a = { bg = c.bg_blue, fg = c.fg },
  b = { bg = c.bg, fg = c.fg_blue },
}

M.terminal = {
  a = { bg = c.bg_blue, fg = c.fg },
  b = { bg = c.bg, fg = c.fg_blue },
}

-- inactive when there are split windows
M.inactive = {
  a = { bg = c.bg, fg = c.fg_overlay3 },
  b = { bg = c.bg, fg = c.fg_overlay3 },
  c = { bg = c.bg, fg = c.fg_overlay3 },
}

return M
