local M = {}

local function set_defaults()
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
  vim.cmd "colorscheme onedark"
end

M.telescope = function()
  return function()
    require("telescope").setup()
  end
end

M.lualine = function()
  return function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "onedark",
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
end

M.bufferline = function()
  return function()
    require("bufferline").setup {
      options = {
        diagnostics = true,
        separator_style = "slant",
      },
    }
  end
end

M.colorizer = function()
  return function()
    local is_colorizer_loaded, colorizer = pcall(require, "colorizer")
    if not is_colorizer_loaded then
      return
    end
    colorizer.setup({ "*" }, {
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
end

M.gitsigns = function()
  return function()
    require("gitsigns").setup {
      signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      keymaps = {},
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = false,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    }
  end
end

M.kommentary = function()
  return function()
    vim.g.kommentary_create_default_mappings = false
    local config = require "kommentary.config"
    config.configure_language({ "python", "go", "javascript", "typescript", "lua" }, {
      prefer_single_line_comments = true,
    })
  end
end

M.nvim_tree = function()
  return function()
    require("nvim-tree").setup {
      update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
      },
      view = {
        width = 50,
        height = 30,
        side = "left",
        auto_resize = false,
        mappings = {
          custom_only = false,
          list = {},
        },
      },
      filters = {
        dotfiles = false,
        custom = { ".git" },
      },
    }
  end
end

M.neoformat = function()
  return function()
    -- Enabled formatters
    vim.g.neoformat_enabled_python = { "black", "isort" }
    vim.g.neoformat_enabled_lua = { "stylua" }
    vim.g.neoformat_enabled_typescript = { "prettier" }
    vim.g.neoformat_enabled_javascript = { "prettier" }
    vim.g.neoformat_enabled_go = { "gofmt", "goimports" }
    -- Local formatters
    vim.g.neoformat_javascript_prettier = {
      exe = "./node_modules/.bin/prettier",
      args = { "--write", "--config .prettierrc" },
      replace = 1,
    }
    vim.g.neoformat_typescript_prettier = {
      exe = "./node_modules/.bin/prettier",
      args = { "--write", "--config .prettierrc" },
      replace = 1,
    }
  end
end

M.neomake = function()
  return function()
    vim.g.neomake_python_enabled_makers = { "python", "pylint" }
    vim.g.neomake_lua_enabled_makers = { "luac", "luacheck" }
    vim.g.neomake_typescript_enabled_makers = { "tsc" }
    vim.g.neomake_javascript_enabled_makers = { "eslint" }
    vim.g.neomake_go_enabled_makers = { "go", "go vet", "golangci-lint" }
    -- vim.fn["neomake#configure#automake"]("nw", 750)
  end
end

M.dashboard = function()
  vim.g.dashboard_default_executive = "telescope"
  vim.g.dashboard_custom_header = {
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
  vim.g.dashboard_custom_section = {
    a = { description = { "✎  New File                     SPC n  " }, command = "DashboardNewFile" },
    b = { description = { "ﮮ  Find Recents                 SPC f r" }, command = "Telescope oldfiles" },
    c = { description = { "  Find File                    SPC f f" }, command = "Telescope find_files" },
    d = { description = { "ﯔ  Find Word                    SPC f g" }, command = "Telescope live_grep" },
    e = { description = { "❖  Find Tag                     SPC f t" }, command = "Telescope tags" },
  }
  vim.g.dashboard_custom_footer = {
    "",
    "",
    "Enjoy your pain... 🥵🥵🥵",
  }
end

M.indent_blankline = function()
  return function()
    vim.g.indentLine_enabled = 1
    vim.g.indent_blankline_char = "▏"
    vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
    vim.g.indent_blankline_buftype_exclude = { "terminal" }
    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_first_indent_level = false
  end
end

M.wich_key = function()
  return function()
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
end

M.floaterm = function()
  return function()
    vim.g.floaterm_wintype = "split"
    vim.g.floaterm_position = "botright"
    vim.g.floaterm_keymap_toggle = "<C-t>"
  end
end

M.cmp = function()
  return function()
    local lspkind = require "lspkind"
    local cmp = require "cmp"
    cmp.setup {
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
        end,
      },
      mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      },
      sources = {
        { name = "vsnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.kind = lspkind.presets.default[vim_item.kind]
          vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
          })[entry.source.name]
          return vim_item
        end,
      },
    }
  end
end

M.lspkind = function()
  return function()
    local is_lsp_kind_loaded, lsp_kind = pcall(require, "lspkind")
    if not is_lsp_kind_loaded then
      return
    end
    lsp_kind.init()
  end
end

M.trouble = function()
  return function()
    local is_trouble_loaded, trouble = pcall(require, "trouble")
    if not is_trouble_loaded then
      return
    end
    trouble.setup {
      position = "bottom",
      height = 20,
    }
  end
end

M.vim_test = function()
  return function()
    vim.g["test#strategy"] = "floaterm"
    -- vim.g["test#javascript#jest#file_pattern"] = "\v(__tests__/.*|(spec|test|spec-integration)).(js|jsx|coffee|ts|tsx)$"
  end
end

M.markdown_preview = function()
  return function()
    vim.g.mkdp_browser = "brave-browser"
    vim.g.mkdp_echo_preview_url = 1
  end
end

M.init = function()
  set_defaults()
  set_colorscheme()
  M.dashboard()
end

return M
