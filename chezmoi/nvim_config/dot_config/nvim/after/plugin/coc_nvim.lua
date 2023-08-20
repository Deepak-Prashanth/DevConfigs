vim.g.coc_config_home = '$HOME/.config/nvim'
vim.g.coc_data_home = '$HOME/.config/nvim'
vim.g.coc_config_file = '$HOME/.config/nvim/coc-settings.json'
local allowed_filetype = {'c', 'cpp', 'h', 'hpp', 'cxx', 'hxx', 'cuda', 'objc'}
if allowed_filetype[vim.bo.filetype] then
  vim.cmd('source $HOME/.config/nvim/coc-settings.vimrc')
end

-- Add remaining plugins
-- 'coc-json', 'coc-rust-analyzer', 'coc-cmake', 'coc-db', 'coc-sql', 'coc-pyright'
vim.g.coc_global_extensions = {'coc-yank'}
