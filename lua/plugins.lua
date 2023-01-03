---@diagnostic disable: undefined-global
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local M = {}

function M.init()
  return require("packer").startup(function()
    -- Packer can manage itself
    use { "wbthomason/packer.nvim" }

    -- Git
    use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = require("config/git").gitsigns,
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

    -- Base features
    use {
      "b3nj5m1n/kommentary",
      config = require("config/base").kommentary,
    }
    use { "editorconfig/editorconfig-vim" }
    use { "yuttie/comfortable-motion.vim" }
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = require("config/base").indent_blankline,
    }

    -- Colorschemes
    use { "morhetz/gruvbox" }
    use { "joshdick/onedark.vim" }
    use { "folke/tokyonight.nvim" }

    -- Finders
    use { "junegunn/fzf", dir = "~/.fzf", run = "./install --all" }
    use { "junegunn/fzf.vim" }
    use { "justinmk/vim-sneak" }
    use { "mg979/vim-visual-multi" }

    -- LSP, Syntaxs
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "jayp0521/mason-null-ls.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim", config = require("config/lsp").null_ls }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- Autocomplete
    use { "nvim-lua/completion-nvim" }
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
      config = require("config/autocomplete").cmp,
      after = { "lspkind-nvim" },
    }
    use {
      "onsails/lspkind-nvim",
      config = require("config/lsp").lspkind,
    }
    use { "hashivim/vim-terraform" }
    use { "ray-x/lsp_signature.nvim" }

    -- Snippets
    use { "rafamadriz/friendly-snippets" }
    use { "andys8/vscode-jest-snippets" }

    -- GUI
    use { "nvim-lua/popup.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "glepnir/dashboard-nvim" }
    use {
      "folke/which-key.nvim",
      config = require("config/gui").wich_key,
      event = "BufWinEnter",
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = require("config/gui").telescope,
    }
    use { "kyazdani42/nvim-web-devicons" }
    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = require("config/gui").nvim_tree,
    }
    use {
      "hoob3rt/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = require("config/gui").lualine,
    }
    use {
      "akinsho/nvim-bufferline.lua",
      config = require("config/gui").bufferline,
    }
    use {
      "norcalli/nvim-colorizer.lua",
      config = require("config/gui").colorizer,
    }
    use {
      "voldikss/vim-floaterm",
      config = require("config/gui").floaterm,
    }
    use {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
      config = require("config/gui").trouble,
    }

    --   Testing
    use {
      "vim-test/vim-test",
      cmd = {
        "TestNearest",
        "TestFile",
        "TestSuite",
        "TestLast",
        "TestVisit",
      },
      config = require("config/testing").vim_test,
    }

    -- Performance
    use { "dstein64/vim-startuptime" }

    -- Update after init
    if packer_bootstrap then
      require("packer").sync()
    end
  end)
end

return M
