require("bootstrap").init()
require("config").init()
require("plugins").init()
require("keymappings").init()
require("lsp").init()

-- Autocommands
vim.cmd [[
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]]
