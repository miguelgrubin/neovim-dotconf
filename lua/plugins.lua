---@diagnostic disable: undefined-global
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local M = {}

function M.init()
  return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Git
    use {
      'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
      config = function() require('gitsigns').setup() end
    }
    use {
      'tpope/vim-fugitive',
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
        "Gedit"
      },
      ft = {"fugitive"}
    }

    -- Basic features
    use 'tpope/vim-commentary'
    use 'editorconfig/editorconfig-vim'
    use 'yuttie/comfortable-motion.vim'
    use  {
      'lukas-reineke/indent-blankline.nvim',
      event = "BufRead",
      setup = function()
        vim.g.indentLine_enabled = 1
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
        vim.g.indent_blankline_buftype_exclude = {"terminal"}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
      end
    }

    -- Colorschemes
    use 'morhetz/gruvbox'
    use 'joshdick/onedark.vim'

    -- Finders
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
    use {'junegunn/fzf.vim'}

    -- Autocomplete, LSP, Syntaxs
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'folke/trouble.nvim', cmd = "TroubleToggle"}
    use 'kabouzeid/nvim-lspinstall'

    -- GUI
    use 'nvim-lua/popup.nvim'
    use 'glepnir/dashboard-nvim'
    use {
      'folke/which-key.nvim',
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-telescope/telescope-project.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'akinsho/nvim-bufferline.lua'
    use 'liuchengxu/vista.vim'
    use 'norcalli/nvim-colorizer.lua'

    --   " Formatter
    --   Plug 'sbdchd/neoformat'

    --   " Snippets
    --   Plug 'SirVer/ultisnips'
    --   " Plug 'honza/vim-snippets'

  end)
end

return M

