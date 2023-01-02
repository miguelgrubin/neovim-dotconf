local M = {}

M.vim_test = function()
  vim.g["test#strategy"] = "floaterm"
  -- vim.g["test#javascript#jest#file_pattern"] = "\v(__tests__/.*|(spec|test|spec-integration)).(js|jsx|coffee|ts|tsx)$"
end

return M
