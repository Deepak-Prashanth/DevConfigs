-- vim.opt.guicursor = ""
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.cursorline = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.mouse = "a"
vim.opt.autowrite = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.wrapscan = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- Theme
vim.cmd.colorscheme "catppuccin"
-- vim.g.lightline = {colorscheme = 'catppuccin_mocha'}

table.insert(vim.opt.switchbuf, "uselast")
vim.opt.completeopt = "menu"
-- table.remove(vim.opt.completeopt, "preview")

-- System clipboard
vim.opt.clipboard = "unnamedplus"

-- Use ripgrep
vim.opt.grepprg = 'rg --vimgrep --smart-case --follow'

-- Timeout
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

vim.opt.syntax = "on"
vim.opt.termguicolors = true

-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldenable = false

vim.opt.background = "dark"

-- Spellcheck
vim.opt.spelllang = en_us
vim.opt.spell = false

-- Add folders into this path. Comma separated
-- Eg: src,build
table.insert(vim.opt.path, "**")

-- Autocommands
local api = vim.api
-- Quickfix window settings
-- Move the quickfix window to the bottom of the window layout
-- Source: https://stackoverflow.com/a/6728687
api.nvim_create_autocmd({"FileType"}, { pattern = {"qf"} , command = [[wincmd J]] })
-- Open quickfix window automatically from 
-- https://vim.fandom.com/wiki/Automatically_open_the_quickfix_window_on_:make
api.nvim_create_autocmd({"QuickFixCmdPost"}, { pattern = {"[^l]*"} , command = [[cwindow]], once=true, nested = true })
api.nvim_create_autocmd({"QuickFixCmdPost"}, { pattern = {"l*"} , command = [[lwindow]], once=true, nested = true })
api.nvim_command('filetype plugin indent on')

-- True color
vim.api.nvim_exec([[
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif]], false)

-- Highlights
vim.cmd[[hi CursorLineNr guifg=#00FF32]]
vim.cmd[[hi CursorLine guibg=#002232]]
vim.cmd[[hi ColorColumn guibg=#005532]]
