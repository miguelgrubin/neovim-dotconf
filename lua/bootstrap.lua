local M = {}

local function replace_grep_with_rg()
  if vim.fn.executable "rg" == 1 then
    vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
    vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
  end
end

local function ensure_lazy_installed()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

function M.init()
  replace_grep_with_rg()
  ensure_lazy_installed()
end


return M
