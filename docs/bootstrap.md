# Bootstrap

This run actions on vim startup livecycle.

## Before All

There are some actions trigged by `bootstrap.before_all()` located at first line on our `init.lua`.

## ensure_packer_installation()

Ensures that [Packer](https://github.com/wbthomason/packer.nvim) it is installed.
Necesary to install more plugins. Git its needed to install it.

## replace_grep_with_rg()

Replaces `grep` to `ripgrep` on `:grep` command and register obtained results on vim `quickfix` to easy manipulation via [Trouble GUI](https://github.com/folke/trouble.nvim)

Use `:help grep` and `:help quickfix` for more info.

## After All

There are some actions trigged by `bootstrap.after_all()` located at last line on our `init.lua`.

### install_missing_plugins()

**To be implemented.** Install plugins using Packer defined on `lua/plugins.lua`

### install_missing_language_servers()

**To be implemented.** Install LSP integratios that has been configured on `lua/lsp.lua`

### install_missing_syntaxs()

**To be implemented.** Install Treesitter syntax that has been configured.
