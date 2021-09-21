local M = {}

local function set_defaults()
  local default_options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8", -- the encoding written to a file
    foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
    foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
    guifont = "monospace:h17", -- the font used in graphical neovim applications
    hidden = true, -- required to keep multiple buffers and open multiple buffers
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
    title = true, -- set the title of window to the value of the titlestring
    updatetime = 300, -- faster completion
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    tabstop = 2, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = false, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    spell = false,
    spelllang = "en",
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
  }
  vim.opt.shortmess:append "c"

  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end
end

local function set_colorscheme()
  if vim.fn.exists "syntax_on" then
    vim.api.nvim_command "syntax reset"
  end
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "onedark"
end

local function set_gui_settings()
  -- @ToDo: move to Telescope Packer config
  require("telescope").setup()
  -- @ToDo: move to Lualine Packer config
  require("lualine").setup {
    options = { theme = "onedark" },
  }
  -- @ToDo: move to Bufferline Packer config
  require("bufferline").setup {
    options = {
      diagnostics = true,
      separator_style = "slant",
    },
  }
  -- @ToDo: move to Colorizer Packer config
  require("colorizer").setup()
  -- @ToDo: move to NvimTree Packer config
  vim.g.nvim_tree_ignore = { ".git", ".cache" }
  vim.g.nvim_tree_follow = 1
end

-- @ToDo: move to Neoformat Packer config
local function set_formatters()
  vim.g.neoformat_enabled_python = { "black", "isort" }
  vim.g.neoformat_enabled_lua = { "stylua" }
  vim.g.neoformat_enabled_typescript = { "prettier" }
  vim.g.neoformat_enabled_javascript = { "prettier" }
  vim.g.neoformat_enabled_go = { "gofmt", "goimports" }
end

-- @ToDo: move to Neomake Packer config
local function set_linters()
  vim.fn["neomake#configure#automake"]("nw", 750)
  vim.g.neomake_python_enabled_makers = { "python", "pylint" }
  vim.g.neomake_lua_enabled_makers = { "luac", "luacheck" }
  vim.g.neomake_typescript_enabled_makers = { "tsc", "eslint" }
  vim.g.neomake_javascript_enabled_makers = { "eslint" }
  vim.g.neomake_go_enabled_makers = { "go", "go vet", "golangci-lint" }
end

M.init = function()
  set_defaults()
  set_colorscheme()
  set_gui_settings()
  set_formatters()
  set_linters()
end

M.dashboard = function()
  vim.g.dashboard_default_executive = "telescope"
  vim.g.dashboard_custom_header = {
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  }
  vim.g.dashboard_custom_section = {
    a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
    b = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
    c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
    d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
  }
  vim.g.dashboard_custom_footer = { "Enjoy your pain" }
end

M.indent_blankline = function()
  vim.g.indentLine_enabled = 1
  vim.g.indent_blankline_char = "▏"
  vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
  vim.g.indent_blankline_buftype_exclude = { "terminal" }
  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.indent_blankline_show_first_indent_level = false
end

M.wich_key = function()
  local km = require "keymappings"
  local wk = require "which-key"
  wk.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  wk.register(km.leader_v_mappings, km.leader_v_opts)
  wk.register(km.leader_n_mappings, km.leader_n_opts)
end

return M
