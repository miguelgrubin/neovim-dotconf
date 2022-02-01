local M = {}

local function autocommands()
  vim.cmd [[
    augroup fmt
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
    augroup END
  ]]
end

local function custom_commands()
  vim.cmd [[
    command Q q
    command W w
    command Wq wq
    command WQ wq
    command Qa qa
    command QA qa
  ]]
end

function M.init()
  autocommands()
  custom_commands()
end

return M
