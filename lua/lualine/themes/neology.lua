local c = require("neology.colors").setup()

local M = {}

M.normal = {
  a = { bg = c.bg, fg = c.fg_primary },
  -- a = { fg = c.fg_primary, bg = c.bg },
  b = { bg = c.bg, fg = c.fg_primary },
  c = { bg = c.bg, fg = c.fg_overlay2 },
}

M.insert = {
  a = { bg = c.bg, fg = c.fg_coral },
  -- a = { bg = c.fg_gray, fg = c.bg },
  b = { bg = c.bg, fg = c.fg_coral },
}

M.command = {
  a = { bg = c.bg, fg = c.fg_yellow },
  -- a = { bg = c.fg_blue, fg = c.bg },
  b = { bg = c.bg, fg = c.fg_yellow },
}

M.visual = {
  a = { bg = c.bg, fg = c.fg_purple },
  -- a = { bg = c.fg_purple, fg = c.bg },
  b = { bg = c.bg, fg = c.fg_purple },
}

M.replace = {
  a = { bg = c.bg, fg = c.fg_lime },
  -- a = { bg = c.fg_brown, fg = c.bg },
  b = { bg = c.bg, fg = c.fg_lime },
}

M.terminal = {
  a = { bg = c.bg, fg = c.fg_blue },
  -- a = { bg = c.fg_blue, fg = c.bg },
  b = { bg = c.bg, fg = c.fg_blue },
}

-- inactive when there are split windows
M.inactive = {
  a = { bg = c.bg, fg = c.fg_overlay3 },
  b = { bg = c.bg, fg = c.fg_overlay3 },
  c = { bg = c.bg, fg = c.fg_overlay3 },
}

return M
