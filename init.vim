
" Base Vim config
set nocompatible " be iMproved, required
filetype off     " required
syntax enable
set number
set hidden
set nowrap
set background=dark
filetype plugin indent on
set encoding=UTF-8
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set expandtab
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set cmdheight=2
set updatetime=50
set signcolumn=yes
set mouse=a
let mapleader = "\<Space>"
set timeoutlen=500
noremap <Space> <Nop>

"---- vim-plug setup  ----
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
"-------- end vim-plug setup ----

call plug#begin('~/.config/nvim/plugged')

" Git, Comments, EditorConfig
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'

" Color schemes
" Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

" GUI Plugins (File Explorer, CTags, Splash Screen, Wiki, Icons)
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'majutsushi/tagbar'

" Splash Screen, Wiki, Quick Motions, 
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'justinmk/vim-sneak'
Plug 'liuchengxu/vim-which-key'

" Autocomplete, LSP, Syntaxs
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kosayoda/nvim-lightbulb'
Plug 'styled-components/vim-styled-components'               " Styled Components syntax
Plug 'pantharshit00/vim-prisma'                              " Prisma syntax

" Formatter
Plug 'sbdchd/neoformat'

" Snippets
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Finders
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


source $HOME/.config/nvim/plug-config/gui.vim
source $HOME/.config/nvim/plug-config/lsp.vim

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Snippets Config
let g:completion_enable_snippet = 'UltiSnips'

" Fn, Alt and Ctrl key mappings
nnoremap <F2> :TagbarToggle<CR>
nnoremap <F3> :NvimTreeToggle<CR>
nnoremap <A-PageUp> :bprev<CR>
nnoremap <A-PageDown> :bnext<CR>
" nnoremap <C-r> :Buffers<CR>
nnoremap <C-p> e :Files<CR>
nnoremap <C-Space> :!tilix --action=session-add-down<CR>

" Identation made easy
vmap <Tab> >gv
vmap <S-Tab> <gv

" Numeric 'Macros'
" nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
" nnoremap <silent><leader>2 :e ~/.config/nvim/init.vim<CR>

" Buffer Mappings
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bv :bprev<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bf :Neoformat<CR>
nnoremap <leader>bl :Neomake<CR>

" Comment Mappings
nnoremap <leader>c :Commentary<CR>
vnoremap <leader>c :Commentary<CR>

" Finder Mappings
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Git Mappings
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gb :Git blame<CR>
