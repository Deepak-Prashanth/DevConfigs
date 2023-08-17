local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-k>', ':Telescope<CR>', {})
vim.keymap.set('n', '<C-k>g', builtin.live_grep, {})
vim.keymap.set('n', '<C-k>G', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>gs', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
vim.keymap.set('n', '<C-k>h', builtin.help_tags, {})
vim.keymap.set('n', '<C-k>r', builtin.registers, {})
