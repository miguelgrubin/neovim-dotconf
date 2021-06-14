" GUI and colors settings
if has('termguicolors')
  set termguicolors
endif

" let g:molokai_original = 1
" let g:rehash256 = 1
" colorscheme molokai
autocmd vimenter * ++nested colorscheme gruvbox

" Tree Settings
let g:nvim_tree_ignore = [ '.git', '.cache' ] "empty by default
let g:nvim_tree_follow = 1

lua << EOF
-- Lua Line
require'lualine'.setup {
  options = {theme = 'gruvbox'},
}

-- Buffer Line
require'bufferline'.setup {
  options = {
    diagnostics = true,
    separator_style = "slant"
  }
}
EOF

let g:startify_custom_header = [
        \ '                                                ▟▙            ',
        \ '                                                ▝▘            ',
        \ '        ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
        \ '        ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
        \ '        ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
        \ '        ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
        \ '        ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
        \ '        '
        \]
let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Dev',
            \ ]
let g:startify_change_to_vcs_root = 1


let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

lua << EOF
require'telescope'.load_extension('project')
vim.api.nvim_set_keymap(
	'n',
	'<space>p',
	":lua require'telescope'.extensions.project.project{}<CR>",
	{noremap = true, silent = true}
)
EOF

