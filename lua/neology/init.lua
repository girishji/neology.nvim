local M = {}

M.options = {
  theme = 'dark', -- light/dark
}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
  local theme = require('neology.theme').setup(M.options)
  require('neology.util').load(theme)
end

return M
