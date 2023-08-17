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
  vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", { noremap = false, silent = true })
  vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>FloatermToggle num_1<cr>", { noremap = false, silent = true })
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
  ["/"] = { "<Plug>kommentary_visual_default<cr>", "Comment" },
}

M.leader_n_mappings = {
  ["c"] = { "<cmd>bd<CR>", "Close Buffer" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["n"] = { "<cmd>enew<CR>", "New File" },
  ["/"] = { "<Plug>kommentary_motion_default<cr>", "Comment" },
  ["d"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostic Popup" },
  ["p"] = { "<cmd>Lazy<cr>", "Plugins" },
  b = {
    name = "Buffers",
    b = { "<cmd>Telescope buffers<cr>", "List Buffers" },
    t = { "<cmd>Telescope current_buffer_tags<cr>", "Buffer Tags" },
    n = { "<cmd>BufferLineCycleNext<CR>", "Buffer Next" },
    N = { "<cmd>BufferLineCyclePrev<CR>", "Buffer Prev" },
    p = { "<cmd>BufferLinePick<CR>", "Buffer Pick" },
    l = { "<cmd>BufferLineMoveNext<cr>", "Move Next" },
    h = { "<cmd>BufferLineMovePrev<cr>", "Move Prev" },
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
    g = { "<cmd>Telescope live_grep<cr>", "Find Grep" },
    t = { "<cmd>Telescope tags<cr>", "Find Tags" },
    r = { "<cmd>Telescope oldfiles<cr>", "Find Recent" },
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
    m = { "<cmd>Mason<cr>", "Mason" },
  },
  m = {
    name = "Make",
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
    t = { "<cmd>TestFile<cr>", "Test File" },
    n = { "<cmd>TestNearest<cr>", "Test Nearest" },
  },
}

return M
