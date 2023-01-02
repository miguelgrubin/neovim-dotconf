local M = {}

M.lualine = function()
  require("lualine").setup {
    options = {
      icons_enabled = true,
      theme = "tokyonight",
    },
    sections = {
      lualine_a = { "mode", "paste" },
      lualine_b = {
        { "branch", icon = "" },
        { "diff", color_added = "#a7c080", color_modified = "#ffdf1b", color_removed = "#ff6666" },
      },
      lualine_c = {
        --   { "diagnostics", sources = { "nvim_lsp" } },
        --   function()
        --     return "%="
        --   end,
        --   "filename",
        --   { getWords },
      },
      lualine_x = { "filetype" },
      lualine_y = {
        {
          "progress",
        },
      },
      lualine_z = {
        {
          "location",
          icon = "",
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }
end

M.bufferline = function()
  require("bufferline").setup {
    options = {
      diagnostics = true,
      separator_style = "slant",
    },
  }
end

M.colorizer = function()
  require("colorizer").setup({ "*" }, {
    RGB = true,
    RRGGBB = true,
    names = false,
    RRGGBBAA = false,
    rgb_fn = false,
    hsl_fn = false,
    css = true,
    css_fn = true,
    mode = "background",
  })
end

M.nvim_tree = function()
  require("nvim-tree").setup {
    update_focused_file = {
      enable = true,
      update_cwd = false,
      ignore_list = {},
    },
    view = {
      width = 50,
      side = "left",
      mappings = {
        custom_only = false,
        list = {},
      },
    },
    filters = {
      dotfiles = false,
      custom = { "^\\.git" },
    },
  }
end

M.dashboard = function()
  local db = require "dashboard"
  -- vim.g.dashboard_default_executive = "telescope"
  db.custom_header = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    "",
    "",
    "",
  }
  db.custom_center = {
    { icon = "✎ ", desc = "New File           ", shortcut = "", action = "DashboardNewFile" },
    { icon = "ﮮ ", desc = "Find Recents       ", shortcut = "", action = "Telescope oldfiles" },
    { icon = " ", desc = "Find File          ", shortcut = "", action = "Telescope find_files" },
    { icon = "ﯔ ", desc = "Find Word          ", shortcut = "", action = "Telescope live_grep" },
    { icon = "❖ ", desc = "Find Tag           ", shortcut = "", action = "Telescope tags" },
  }
  db.custom_footer = {
    "",
    "",
    "Enjoy your pain... 🥵🥵🥵",
  }
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

M.floaterm = function()
  vim.g.floaterm_wintype = "split"
  vim.g.floaterm_position = "botright"
  vim.g.floaterm_keymap_toggle = "<C-t>"
end

M.trouble = function()
  require("trouble").setup {
    position = "bottom",
    height = 20,
  }
end

M.telescope = function()
  require("telescope").setup()
end

M.dashboard()

return M
