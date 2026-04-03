local M = {}

M.set_defaults = function()
  local default_options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = { "menu", "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    foldmethod = "manual",
    foldexpr = "",
    guifont = "monospace:h17",
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    pumheight = 10,
    showmode = false,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 100,
    title = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    cursorline = true,
    number = true,
    relativenumber = false,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    spell = false,
    spelllang = "en",
    scrolloff = 8,
    sidescrolloff = 8,
    list = true,
  }
  vim.opt.shortmess:append "c"
  vim.opt.listchars:append "space:⋅"

  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end
end

M.kommentary = function()
  vim.g.kommentary_create_default_mappings = false
  local config = require "kommentary.config"
  config.configure_language({ "python", "go", "javascript", "typescript", "lua" }, {
    prefer_single_line_comments = true,
  })
end

M.indent_blankline = function()
  require("ibl").setup()
end

M.init = function()
  M.set_defaults()
end

return M
