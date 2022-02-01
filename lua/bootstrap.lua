local M = {}

local function ensure_packer_installation()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd "packadd packer.nvim"
  end
end

local function replace_grep_with_rg()
  error, result = pcall(f, "rg")
  if not error then
    vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
    vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
  end
end

function M.before_all()
  ensure_packer_installation()
  replace_grep_with_rg()
end

function M.after_all() end

return M
