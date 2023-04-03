local M = {}

function M.highlight(group, hl)
  if hl.gui then
    if hl.gui == 'italic' then
      hl.italic = true
    elseif hl.gui == 'bold' then
      hl.bold = true
    elseif hl.gui == 'underline' then
      hl.underline = true
    elseif hl.gui == 'undercurl' then
      hl.undercurl = true
    elseif hl.gui == 'NONE' then
      hl = {}
    end
    hl.gui = nil
  end
  vim.api.nvim_set_hl(0, group, hl)
end

function M.load(theme)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "neology"

  for group, hl in pairs(theme) do
    M.highlight(group, hl)
  end
end

return M
