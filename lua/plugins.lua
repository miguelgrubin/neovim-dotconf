local M = {}

function M.init()
  local plugins = {
    -- GIT
    {
      "lewis6991/gitsigns.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = require("config/git").gitsigns,
    },
    {
      "tpope/vim-fugitive",
      cmd = {
        "G",
        "Git",
        "Gdiff",
        "Gdiffsplit",
        "Gvdiffsplit",
        "Gread",
        "Gwrite",
        "Ggrep",
        "GMove",
        "GDelete",
        "GBrowse",
        "GRemove",
        "GRename",
        "Glgrep",
        "Gedit",
      },
      ft = { "fugitive" },
    },

    -- Base features
    {
      "b3nj5m1n/kommentary",
      config = require("config/base").kommentary,
    },
    "editorconfig/editorconfig-vim",
    "yuttie/comfortable-motion.vim",
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = require("config/base").indent_blankline,
    },

    -- Colorschemes
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme tokyonight]])
      end,
    },

    -- Finders
    "justinmk/vim-sneak",
    "mg979/vim-visual-multi",
    {
      "nvim-telescope/telescope.nvim",
      version = "0.1.5",
      dependencies = { { "nvim-lua/plenary.nvim" } },
      config = require("config/gui").telescope,
    },
    {
      "junegunn/fzf",
      dir = "~/.fzf",
      run = "./install --all",
    },
    "junegunn/fzf.vim",

    -- LSP, Syntaxs
    "neovim/nvim-lspconfig",
    {
      "williamboman/mason.nvim",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
      },
      init = require("config/lsp").mason,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      init = require("config/lsp").treesitter,
    },

    -- Autocomplete
    "github/copilot.vim",
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        -- "hrsh7th/cmp-calc",
        -- "hrsh7th/cmp-buffer",
        -- "hrsh7th/cmp-path",
        -- "hrsh7th/cmp-vsnip",
        -- "hrsh7th/vim-vsnip",
        -- "L3MON4D3/LuaSnip",
        -- "saadparwaiz1/cmp_luasnip",
      },
      config = require("config/autocomplete").cmp,
    },
    {
      "onsails/lspkind-nvim",
      config = require("config/lsp").lspkind,
    },
    "ray-x/lsp_signature.nvim",

    -- Snippets
    "rafamadriz/friendly-snippets",
    "andys8/vscode-jest-snippets",

    --   -- GUI
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    {
      "folke/which-key.nvim",
      config = require("config/gui").wich_key,
      event = "BufWinEnter",
    },
    "nvim-tree/nvim-web-devicons",
    {
      "kyazdani42/nvim-tree.lua",
      config = require("config/gui").nvim_tree,
    },
    {
      "hoob3rt/lualine.nvim",
      config = require("config/gui").lualine,
    },
    {
      "akinsho/nvim-bufferline.lua",
      config = require("config/gui").bufferline,
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = require("config/gui").colorizer,
    },
    {
      "voldikss/vim-floaterm",
      config = require("config/gui").floaterm,
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
      config = require("config/gui").trouble,
    },

    --   Testing
    {
      "vim-test/vim-test",
      cmd = {
        "TestNearest",
        "TestFile",
        "TestSuite",
        "TestLast",
        "TestVisit",
      },
      config = require("config/testing").vim_test,
    },
  }
  require("lazy").setup(plugins)
end

return M
