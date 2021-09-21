local M = {}

M.init = function()
  vim.g.mapleader = " "
  vim.g.timeoutlen = 500

  -- Buffer navigation made easy
  vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = false, silent = false })
  vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = false, silent = false })

  -- Identation made easy
  vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = false, silent = true })
  vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = false, silent = true })

  -- Ctrl
  vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>GFiles<cr>", { noremap = false, silent = true })
end

M.leader_v_opts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

M.leader_n_opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

M.leader_v_mappings = {
  ["/"] = { ":Commentary<CR>", "Comment" },
}

M.leader_n_mappings = {
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["c"] = { "<cmd>bd<CR>", "Close Buffer" },
  ["/"] = { "<cmd>Commentary<CR>", "Comment" },
  b = {
    name = "Buffers",
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "List Buffers" },
    n = { "<cmd>BufferLineCycleNext<CR>", "Buffer Next" },
    N = { "<cmd>BufferLineCyclePrev<CR>", "Buffer Prev" },
    p = { "<cmd>BufferLinePick<CR>", "Buffer Pick" },
    c = { "<cmd>bd<CR>", "Close Buffer" },
    l = { "<cmd>BufferLineMoveNext<cr>", "Move Next" },
    h = { "<cmd>BufferLineMovePrev<cr>", "Move Prev" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    b = { "<cmd>Git blame<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    g = { "<cmd>Git<cr>", "Git" },
    d = { "<cmd>Gvdiffsplit!<cr>", "Git Diff" },
  },
  t = {
    name = "Trouble",
    t = { "<cmd>TroubleToggle<cr>", "Toggle" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
  },
  f = {
    name = "Search",
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    g = { "<cmd>GFiles<cr>", "Git Files" },
    a = { "<cmd>Ag<cr>", "Ag" },
    r = { "<cmd>Rg<cr>", "Rg" },
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    -- f = { "<cmd>silent FormatWrite<cr>", "Format" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
      "Prev Diagnostic",
    },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  m = {
    name = "Make",
    f = { "<cmd>Neoformat<cr>", "Format" },
    l = { "<cmd>Neomake<cr>", "Lint" },
    t = { "<cmd>TestFile<cr>", "Test File" },
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["r"] = { "<cmd>Vista!!<CR>", "Tagbar" },
}

return M
