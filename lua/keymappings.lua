local M = {}

M.init = function()
  vim.g.mapleader = " "
  vim.g.timeoutlen = 500

  -- Buffer navigation made easy
  vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = false, silent = false })
  vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = false, silent = false })
  vim.api.nvim_set_keymap("n", "<C-1>", ":BufferLineGoToBuffer 1<CR>", { noremap = false, silent = false })
  vim.api.nvim_set_keymap("n", "<C-2>", ":BufferLineGoToBuffer 2<CR>", { noremap = false, silent = false })
  vim.api.nvim_set_keymap("n", "<C-3>", ":BufferLineGoToBuffer 3<CR>", { noremap = false, silent = false })
  vim.api.nvim_set_keymap("n", "<C-4>", ":BufferLineGoToBuffer 4<CR>", { noremap = false, silent = false })
  vim.api.nvim_set_keymap("n", "<C-5>", ":BufferLineGoToBuffer 5<CR>", { noremap = false, silent = false })

  -- Identation made easy
  vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = false, silent = true })
  vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = false, silent = true })

  -- Ctrl
  vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", { noremap = false, silent = true })
  vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>FloatermToggle num_1<cr>", { noremap = false, silent = true })

  vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
    expr = true,
    replace_keycodes = false
  })
  vim.g.copilot_no_tab_map = true
end

M.leader_mappings = {
  { "<leader>/", "<Plug>kommentary_visual_default<cr>", desc="Comment", mode={"v", "n"}, icon="󰈬" },
  { "<leader>c", "<cmd>bd<CR>", desc="Close Buffer", mode="n" },
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc="Explorer", mode="n", icon="" },
  { "<leader>n", "<cmd>enew<CR>", desc="New File", mode="n" },
  { "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>", desc="Diagnostic Popup", mode="n" },
  { "<leader>p", "<cmd>Lazy<cr>", desc="Plugins", mode="n", icon="󰆧" },

  { "<leader>b", group="Buffers", mode="n" },
  { "<leader>bb", "<cmd>Telescope buffers<cr>", desc="List Buffers", mode="n" },
  { "<leader>bt", "<cmd>Telescope current_buffer_tags<cr>", desc="Buffer Tags", mode="n" },
  { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc="Buffer Next", mode="n" },
  { "<leader>bN", "<cmd>BufferLineCyclePrev<cr>", desc="Buffer Prev", mode="n" },
  { "<leader>bp", "<cmd>BufferLinePick<cr>", desc="Buffer Pick", mode="n" },
  { "<leader>bl", "<cmd>BufferLineMoveNext<cr>", desc="Move Next", mode="n" },
  { "<leader>bh", "<cmd>BufferLineMovePrev<cr>", desc="Move Prev", mode="n" },

  { "<leader>g", group="Git", mode="n" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc="Next Hunk", mode="n" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc="Prev Hunk", mode="n" },
  { "<leader>gb", "<cmd>Git blame<cr>", desc="Blame", mode="n" },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc="Preview Hunk", mode="n" },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc="Reset Hunk", mode="n" },
  { "<leader>gg", "<cmd>Git<cr>", desc="Git", mode="n" },
  { "<leader>gd", "<cmd>Gvdiffsplit!<cr>", desc="Git Diff", mode="n" },

  { "<leader>t", group="Trouble", mode="n" },
  { "<leader>t", "<cmd>TroubleToggle<cr>", desc="Toggle", mode="n" },
  { "<leader>tr", "<cmd>Trouble lsp_references<cr>", desc="References", mode="n" },
  { "<leader>tf", "<cmd>Trouble lsp_definitions<cr>", desc="Definitions", mode="n" },
  { "<leader>td", "<cmd>Trouble lsp_document_diagnostics<cr>", desc="Diagnostics", mode="n" },
  { "<leader>tq", "<cmd>Trouble quickfix<cr>", desc="QuickFix", mode="n" },
  { "<leader>tl", "<cmd>Trouble loclist<cr>", desc="LocationList", mode="n" },
  { "<leader>tw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", desc="Diagnostics", mode="n" },

  { "<leader>f", group="Search", mode="n" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc="Find Files", mode="n" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc="Find Grep", mode="n" },
  { "<leader>ft", "<cmd>Telescope tags<cr>", desc="Find Tags", mode="n" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc="Find Recent", mode="n" },

  { "<leader>l", group="LSP", mode="n", icon="" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc="Code Action", mode="n" },
  { "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", desc="Document Diagnostics", mode="n" },
  { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc="Workspace Diagnostics", mode="n" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc="Info", mode="n" },
  { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>", desc="Next Diagnostic", mode="n" },
  { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>", desc="Prev Diagnostic", mode="n" },
  { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc="Quickfix", mode="n" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc="Rename", mode="n" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc="Document Symbols", mode="n" },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc="Workspace Symbols", mode="n" },
  { "<leader>lm", "<cmd>Mason<cr>", desc="Mason", mode="n" },

  { "<leader>m", group="Make", mode="n", icon="" },
  { "<leader>mf", "<cmd>lua vim.lsp.buf.format()<cr>", desc="Format", mode="n" },
  { "<leader>mt", "<cmd>TestFile<cr>", desc="Test File", mode="n" },
  { "<leader>mn", "<cmd>TestNearest<cr>", desc="Test Nearest", mode="n" },
  { "<leader>mc", "<cmd>!ctags -R<cr>", desc="Ctags", mode="n" },
}

return M
