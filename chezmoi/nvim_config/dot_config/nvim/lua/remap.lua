local keymap = vim.keymap.set

-- Short keys for grep searching
keymap('n', '<leader>g', ':grep <C-R>=expand("<cword>")<CR>', opts)
keymap('n', '<leader>s', ':grep <C-R>=expand("<cword>")<CR> %<CR>', opts)

keymap('n', '<leader>h', ':noh<CR>', opts)
