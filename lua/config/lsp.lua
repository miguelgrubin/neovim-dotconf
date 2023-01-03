local M = {}
local nvim_lsp = require "lspconfig"

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local is_lsp_signature_loaded, lsp_signature = pcall(require, "lsp_signature")
  if is_lsp_signature_loaded then
    lsp_signature.on_attach()
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>Trouble lsp_definitions<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
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

  nvim_lsp.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }

  require("nvim-treesitter.configs").setup {
    highlight = {
      enable = true,
    },
  }
end

M.lspkind = function()
  require("lspkind").init()
end

M.mason = function()
  require("mason").setup {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = {
      "sumneko_lua",
      "clangd",
      "rust_analyzer",
      "tsserver",
      "pyright",
      "gopls",
      "vuels",
      "svelte",
      "angularls",
      "dockerls",
      "eslint",
      "prismals",
      "solargraph",
      "terraformls",
    },
  }
end

M.null_ls = function()
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  local null_ls = require "null-ls"
  null_ls.setup {
    debug = true,
    sources = {
      -- All
      -- null_ls.builtins.code_actions.refactoring,
      -- LUA
      -- null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.formatting.stylua,
      -- JS / TS
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.formatting.prettier,
      -- Python
      null_ls.builtins.diagnostics.pylint,
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.black,
      -- Go
      { null_ls.builtins.diagnostics.golangci_lint },
      { null_ls.builtins.diagnostics.revive },
      { null_ls.builtins.formatting.gofmt },
      { null_ls.builtins.formatting.goimports },
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,
  }
end

M.treesitter = function()
  local is_treesitter_loaded, treesitter = pcall(require, "treesitter")
  if not is_treesitter_loaded then
    return
  end
  treesitter.setup {
    ensure_installed = {
      "go",
      "python",
      "lua",
      "c",
      "cpp",
      "html",
      "css",
      "typescript",
      "rust",
      "javascript",
      "vim",
    },
    auto_install = true,
  }
end


M.mason_null_ls = function()
  require("mason-null-ls").setup({
    ensure_installed = {
      "refactoring",
      "stylua", "luacheck",
      "goimports", "revive", "golangci_lint",
      "prettier", "eslint",
      "black", "isort", "mypy", "pylint",
    }
  })
end

M.mason()
M.mason_null_ls()
M.treesitter()

return M
