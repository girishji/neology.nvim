local M = {}

function M.load(theme)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "neology"

  for group, hl in pairs(theme) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

return M
