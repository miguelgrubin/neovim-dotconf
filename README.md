# Config for Neovim

Full featured Neovim editor to use with:

- Python
- JavaScript
- TypeScript
- Go
- Lua

## Language Features

_LSP_ and snippets to easy autocomplete.
_Linters_ to check fails.
_Formats_ to keep uniform style on your code.
_Testing_ commands to run your tests without leaving Vim.

| Language   | LSP      | Linters                   | Formatters        | Testing | Debugger |
| :--------- | :------- | :------------------------ | :---------------- | :------ | :------- |
| Python     | pyright  | python, pylint            | black, isort      | pytest  | Pending  |
| Javascript | tsserver | eslint                    | prettier          | jest    | Pending  |
| Typescript | tsserver | tsc, eslint               | prettier          | jest    | Pending  |
| Go         | gopls    | go, go vet, golangci-lint | go fmt, goimports | go test | Pending  |
| Lua        |          | luac, luacheck            | stylua            | busted  | Pending  |

## Documentation

- [Bootstrap](/docs/bootstrap.md)
- [Base Config](/docs/config.md)
- [Plugins](/docs/plugins.md)
- [Commands](/docs/cmd.md)
- [Keymappings](/docs/keymappings.md)
- [LSP](/docs/lsp.md)

# Keymappings

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

# Dependencies

- `rg`
- `exa`
- `fd`
- `fzf`
- `ag`
- `z`
