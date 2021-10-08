---@diagnostic disable: undefined-global
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local M = {}

function M.init()
  return require("packer").startup(function()
    -- Packer can manage itself
    use { "wbthomason/packer.nvim" }

    -- Git
    use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = require("config").gitsigns(),
    }
    use {
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
    }

    -- Basic features
    use { "tpope/vim-commentary" }
    use { "editorconfig/editorconfig-vim" }
    use { "yuttie/comfortable-motion.vim" }
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = require("config").indent_blankline(),
    }

    -- Colorschemes
    use { "morhetz/gruvbox" }
    use { "joshdick/onedark.vim" }

    -- Finders
    use { "junegunn/fzf", dir = "~/.fzf", run = "./install --all" }
    use { "junegunn/fzf.vim" }
    use { "justinmk/vim-sneak" }

    -- Autocomplete, LSP, Syntaxs
    use { "neovim/nvim-lspconfig" }
    use { "nvim-lua/completion-nvim" }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
      config = require("config").trouble(),
    }
    use { "kabouzeid/nvim-lspinstall" }
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
        { "hrsh7th/cmp-calc", after = "nvim-cmp" },
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
        { "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
        { "hrsh7th/vim-vsnip", after = "nvim-cmp" },
      },
      config = require("config").cmp(),
      after = { "lspkind-nvim" },
    }
    use {
      "glepnir/lspsaga.nvim",
      config = require("config").lspsaga(),
    }
    use {
      "onsails/lspkind-nvim",
      config = require("config").lspkind(),
    }

    -- Snippets
    use { "rafamadriz/friendly-snippets" }
    use { "andys8/vscode-jest-snippets" }

    -- GUI
    use { "nvim-lua/popup.nvim" }
    use { "glepnir/dashboard-nvim" }
    use {
      "folke/which-key.nvim",
      config = require("config").wich_key(),
      event = "BufWinEnter",
    }
    use { "nvim-lua/plenary.nvim" }
    use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = require("config").telescope(),
    }
    use { "kyazdani42/nvim-web-devicons" }
    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = require("config").nvim_tree(),
    }
    use {
      "hoob3rt/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = require("config").lualine(),
    }
    use {
      "akinsho/nvim-bufferline.lua",
      config = require("config").bufferline(),
    }
    use { "liuchengxu/vista.vim" }
    use {
      "norcalli/nvim-colorizer.lua",
      config = require("config").colorizer(),
    }
    use {
      "voldikss/vim-floaterm",
      config = require("config").floaterm(),
    }

    --   Testing, Formatters, Linters
    use {
      "vim-test/vim-test",
      cmd = {
        "TestNearest",
        "TestFile",
        "TestSuite",
        "TestLast",
        "TestVisit",
      },
      config = require("config").vim_test(),
    }
    use {
      "sbdchd/neoformat",
      cmd = { "Neoformat" },
      config = require("config").neoformat(),
    }
    use {
      "neomake/neomake",
      cmd = { "Neomake" },
      config = require("config").neomake(),
    }
  end)
end

return M
