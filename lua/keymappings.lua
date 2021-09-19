local M = {}
-- nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

-- " Fn, Alt and Ctrl key mappings
-- nnoremap <F2> :TagbarToggle<CR>
-- nnoremap <F3> :NvimTreeToggle<CR>
-- nnoremap <A-PageUp> :bprev<CR>
-- nnoremap <A-PageDown> :bnext<CR>
-- " nnoremap <C-r> :Buffers<CR>
-- nnoremap <C-p> e :Files<CR>
-- nnoremap <C-Space> :!tilix --action=session-add-down<CR>

-- " Identation made easy
-- vmap <Tab> >gv
-- vmap <S-Tab> <gv

-- " Numeric 'Macros'
-- " nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
-- " nnoremap <silent><leader>2 :e ~/.config/nvim/init.vim<CR>

-- " Buffer Mappings
-- nnoremap <leader>bb :Buffers<CR>
-- nnoremap <leader>bn :bnext<CR>
-- nnoremap <leader>bv :bprev<CR>
-- nnoremap <leader>bd :bdelete<CR>
-- nnoremap <leader>bf :Neoformat<CR>
-- nnoremap <leader>bl :Neomake<CR>

-- " Comment Mappings
-- nnoremap <leader>c :Commentary<CR>
-- vnoremap <leader>c :Commentary<CR>

-- " Finder Mappings
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

-- " Git Mappings
-- nnoremap <leader>gd :Git diff<CR>
-- nnoremap <leader>gb :Git blame<CR>

M.init = function ()
  vim.g.mapleader = ' '
  vim.g.timeoutlen = 500
  vim.api.nvim_set_keymap('!', '<space>', '<Nop>', {expr=true, noremap=true})
  vim.api.nvim_set_keymap('n', '<silent><leader>', ':WhichKey \'<Space>\'<CR>', { expr=true, noremap=true})
  -- vim.api.nvim_set_keymap()
  -- vim.api.nvim_set_keymap()
  -- vim.api.nvim_set_keymap()
end

return M
