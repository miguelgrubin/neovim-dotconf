local M = {}

M.neoformat = function()
  return function()
    -- Enabled formatters
    vim.g.neoformat_enabled_python = { "black", "isort" }
    vim.g.neoformat_enabled_lua = { "stylua" }
    vim.g.neoformat_enabled_typescript = { "prettier" }
    vim.g.neoformat_enabled_javascript = { "prettier" }
    vim.g.neoformat_enabled_go = { "gofmt", "goimports" }
    -- Local formatters
    vim.g.neoformat_javascript_prettier = {
      exe = "./node_modules/.bin/prettier",
      args = { "--write", "--config .prettierrc" },
      replace = 1,
    }
    vim.g.neoformat_typescript_prettier = {
      exe = "./node_modules/.bin/prettier",
      args = { "--write", "--config .prettierrc" },
      replace = 1,
    }
  end
end

M.neomake = function()
  return function()
    vim.g.neomake_python_enabled_makers = { "python", "pylint" }
    vim.g.neomake_lua_enabled_makers = { "luac", "luacheck" }
    vim.g.neomake_typescript_enabled_makers = { "tsc" }
    vim.g.neomake_javascript_enabled_makers = { "eslint" }
    vim.g.neomake_go_enabled_makers = { "go", "go vet" }
    -- vim.fn["neomake#configure#automake"]("nw", 750)
  end
end

return M
