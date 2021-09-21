---@diagnostic disable: undefined-global
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local M = {}
local confs = require("config")

function M.init()
  return require("packer").startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Git
    use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("gitsigns").setup()
      end,
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
    use "tpope/vim-commentary"
    use "editorconfig/editorconfig-vim"
    use "yuttie/comfortable-motion.vim"
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        confs.indent_blankline()
      end,
    }

    -- Colorschemes
    use "morhetz/gruvbox"
    use "joshdick/onedark.vim"

    -- Finders
    use { "junegunn/fzf", dir = "~/.fzf", run = "./install --all" }
    use { "junegunn/fzf.vim" }

    -- Autocomplete, LSP, Syntaxs
    use "neovim/nvim-lspconfig"
    use "nvim-lua/completion-nvim"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "folke/trouble.nvim", cmd = "TroubleToggle" }
    use "kabouzeid/nvim-lspinstall"

    -- GUI
    use "nvim-lua/popup.nvim"
    use {
      "glepnir/dashboard-nvim",
      config = function()
        require("config").dashboard()
      end
    }
    use {
      "folke/which-key.nvim",
      config = function()
        confs.wich_key()
      end,
      event = "BufWinEnter",
    }
    use "nvim-lua/plenary.nvim"
    use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
    }
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use {
      "hoob3rt/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }
    use "akinsho/nvim-bufferline.lua"
    use "liuchengxu/vista.vim"
    use "norcalli/nvim-colorizer.lua"

    --   Testing, Formatters, Linters
    use { "vim-test/vim-test", cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" } }
    use { "sbdchd/neoformat", cmd = { "Neoformat" } }
    use { "neomake/neomake", cmd = { "Neomake" } }

    --   " Snippets
    --   Plug 'SirVer/ultisnips'
    --   " Plug 'honza/vim-snippets'
  end)
end

return M
