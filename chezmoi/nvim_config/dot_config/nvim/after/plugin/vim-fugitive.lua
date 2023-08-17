local keymap = vim.keymap.set
keymap('', '<C-g>b', ':Git blame<CR>', opts)
keymap('', '<C-g>r', ':Gclog --name-only<CR>', opts)
