---@diagnostic disable: undefined-global
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local M = {}

function M.init()
  return require("packer").startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Git
    use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("config").gitsigns()
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
      config = function()
        require("config").indent_blankline()
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
    use "glepnir/dashboard-nvim"
    use {
      "folke/which-key.nvim",
      config = function()
        require("config").wich_key()
      end,
      event = "BufWinEnter",
    }
    use "nvim-lua/plenary.nvim"
    use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("config").telescope()
      end
    }
    use "kyazdani42/nvim-web-devicons"
    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require("config").nvim_tree()
      end
    }
    use {
      "hoob3rt/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
        require("config").lualine()
      end
    }
    use {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require("config").bufferline()
      end
    }
    use "liuchengxu/vista.vim"
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("config").colorizer()
      end
    }
    use {
      "voldikss/vim-floaterm",
      config = function()
        require("config").floaterm()
      end
    }

    --   Testing, Formatters, Linters
    use {
      "vim-test/vim-test",
      cmd = {
        "TestNearest",
        "TestFile",
        "TestSuite",
        "TestLast",
        "TestVisit"
      }
    }
    use {
      "sbdchd/neoformat",
      cmd = { "Neoformat" },
      config = function()
        require("config").neoformat()
      end
    }
    use {
      "neomake/neomake",
      cmd = { "Neomake" },
      config = function()
        require("config").neomake()
      end
    }

    --   " Snippets
    --   Plug 'SirVer/ultisnips'
    --   " Plug 'honza/vim-snippets'
  end)
end

return M
