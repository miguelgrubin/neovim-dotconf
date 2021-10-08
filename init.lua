require("bootstrap").init()
require("config").init()
require("plugins").init()
require("keymappings").init()
require("lsp").init()

-- Autocommands
vim.fn["neomake#configure#automake"]("nw", 750)
vim.cmd [[
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]]
