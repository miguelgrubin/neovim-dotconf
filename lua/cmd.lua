local M = {}

local function easy_wq()
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
  easy_wq()
end

return M
