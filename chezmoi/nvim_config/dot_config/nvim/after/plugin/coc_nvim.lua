vim.g.coc_config_home = '$HOME/.config/nvim'
vim.g.coc_data_home = '$HOME/.config/nvim'
vim.g.coc_config_file = '$HOME/.config/nvim/coc-settings.json'
vim.cmd('source $HOME/.config/nvim/coc-settings.vimrc')
-- Add remaining plugins
-- 'coc-json', 'coc-rust-analyzer', 'coc-cmake', 'coc-db', 'coc-sql', 'coc-pyright'
vim.g.coc_global_extensions = {'coc-yank'}
