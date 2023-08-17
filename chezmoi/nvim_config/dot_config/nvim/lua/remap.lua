local keymap = vim.keymap.set

-- Short keys for grep searching
keymap('n', '<leader>g', ':grep <C-R>=expand("<cword>")<CR>', opts)
keymap('n', '<leader>s', ':grep <C-R>=expand("<cword>")<CR> %<CR>', opts)

-- Stop highlighting
keymap('n', '<leader>h', ':noh<CR>', opts)

-- Quickfix navigation
keymap('n', '<C-n>', ':cnext<CR>', opts)
keymap('n', '<C-p>', ':cprevious<CR>', opts)
-- nnoremap <silent> <C-L> :ccl \| noh<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

-- Quickscope toggle
keymap('n', ']S', ':QuickScopeToggle<CR>', opts)
-- vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- Lazygit
keymap('', '<C-g>l', ':FloatermNew --width=0.9 --height=0.9 lazygit<CR>', opts)

-- Tab shortcuts
keymap('', 'Tn', ':tabnew', opts)

-- Undotree
keymap('n', ']U', ':UndotreeToggle<CR>', opts)

-- Fuzzy finder for files
keymap('n', '<C-j>', ':Files<CR>', opts)
