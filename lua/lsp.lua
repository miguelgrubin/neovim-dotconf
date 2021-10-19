local M = {}
local nvim_lsp = require "lspconfig"

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

  -- local function t(str)
  --   return vim.api.nvim_replace_termcodes(str, true, true, true)
  -- end
  -- function _G.smart_tab()
  --   return vim.fn.pumvisible() == 1 and t "<C-n>" or t "<Tab>"
  -- end
  -- function _G.smart_stab()
  --   return vim.fn.pumvisible() == 1 and t "<C-p>" or t "<S-Tab>"
  -- end

  -- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.smart_tab()", { expr = true, noremap = true })
  -- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.smart_stab()", { expr = true, noremap = true })
end

M.init = function()
  nvim_lsp.tsserver.setup {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    init_options = {
      hostInfo = "neovim",
      preferences = {
        importModuleSpecifierPreference = "relative",
      },
    },
    on_attach = on_attach,
  }

  local servers = { "pyright", "gopls", "vuels", "svelte", "clangd", "rust_analyzer", "solargraph" }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end

  require("nvim-treesitter.configs").setup {
    highlight = {
      enable = true,
    },
  }
end

return M
