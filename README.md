# Config for Neovim

# What is inside?

Full featured Neovim editor to use with:
- Python
- JavaScript
- TypeScript
- Go

## Language Features

*LSP* and snippets to easy autocomplete.
*Linters* to check fails.
*Formats* to keep uniform style on your code.
*Testing* commands to run your tests without leaving Vim.

| Language   | LSP      | Linters                        | Formatters                   | Testing               |
|:-----------|:---------|:-------------------------------|:-----------------------------|:----------------------|
| Python     | pyright  | python, pylint                 | black, isort                 | pytest                |
| Javascript | tsserver | eslint                         | prettier                     | jest                  |
| Typescript | tsserver | tsc, eslint                    | prettier                     | jest                  |
| Go         | gopls    | go, go vet, golangci-lint      | go fmt, goimports            | go test               |
| Lua        |          | luac, luacheck                 | stylua                       | busted                |

## GUI

- Colorschemes: OneDark, Gruvbox
- Plugin Manager: Packer
- Snippets: UtilSnippets
- Git: gitsigns, vim-fugitive
- CTags: Vista
- Finders: Telescope, Fzf, Ag, Rg
- Formatters: Neoformat
- Linters: Neomake, editorconfig
- Testing: vim-test
- LSP: lsp-config, lsp-install, completion-nvim
- Syntax: Treesitter
- Commments: commentary
- Scroll integration: comfortable-motion
- GUI improvements: trouble, ident-blankline, dashboard, which-key, nvim-tree, lualine, vista, nvim-colorizer


# Keymappings (TODO)
- Easy Buffers
- Easy Indent
- Go to mappings
- Space mappings
- Ctrl+ mappings


# File structure

```
├── init.lua
├── LICENSE
├── lua
│   ├── bootstrap.lua     <- Ensure that package manager its installed each start
│   ├── config.lua        
│   ├── keymappings.lua   
│   ├── lsp.lua           
│   └── plugins.lua       
└── README.md
```
