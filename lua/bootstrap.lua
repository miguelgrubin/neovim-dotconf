local M = {}

local function replace_grep_with_rg()
  if vim.fn.executable "rg" == 1 then
    vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
    vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
  end
end

function M.init()
  replace_grep_with_rg()
end

return M
