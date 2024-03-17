-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Fugitive
keymap('', '<C-g>b', ':Git blame<CR>', opts)
keymap('', '<C-g>r', ':Gclog --name-only<CR>', opts)

-- PerfAnno
keymap("n", "<LEADER>plf", ":PerfLoadFlat<CR>", opts)
keymap("n", "<LEADER>plg", ":PerfLoadCallGraph<CR>", opts)
keymap("n", "<LEADER>plo", ":PerfLoadFlameGraph<CR>", opts)

keymap("n", "<LEADER>pe", ":PerfPickEvent<CR>", opts)

keymap("n", "<LEADER>pa", ":PerfAnnotate<CR>", opts)
keymap("n", "<LEADER>pf", ":PerfAnnotateFunction<CR>", opts)
keymap("v", "<LEADER>pa", ":PerfAnnotateSelection<CR>", opts)

keymap("n", "<LEADER>pt", ":PerfToggleAnnotations<CR>", opts)

keymap("n", "<LEADER>ph", ":PerfHottestLines<CR>", opts)
keymap("n", "<LEADER>ps", ":PerfHottestSymbols<CR>", opts)
keymap("n", "<LEADER>pc", ":PerfHottestCallersFunction<CR>", opts)
keymap("v", "<LEADER>pc", ":PerfHottestCallersSelection<CR>", opts)

-- Ouroboros
keymap("n", "<LEADER>h", ":Ouroboros<CR>", opts)

-- Toggle Zen mode
keymap("n", "[Z", function()
  require("zen-mode").setup {
    window = {
      width = 120,
      options = {}
    },
  }
  require("zen-mode").toggle()
  vim.wo.wrap = true
  vim.wo.number = true
  vim.wo.rnu = true
end)
-- No line numbers
keymap("n", "]Z", function()
  require("zen-mode").setup {
    window = {
      width = 120,
      options = {}
    },
  }
  require("zen-mode").toggle()
  vim.wo.wrap = true
  vim.wo.number = false
  vim.wo.rnu = false
  vim.opt.colorcolumn = "0"
end)

-- Yanky
keymap({"n","x"}, "<leader>yp", "<Plug>(YankyPutAfter)", opts)
keymap({"n","x"}, "<leader>yP", "<Plug>(YankyPutBefore)", opts)
keymap({"n","x"}, "<leader>ygp", "<Plug>(YankyGPutAfter)", opts)
keymap({"n","x"}, "<leader>ygP", "<Plug>(YankyGPutBefore)", opts)
keymap("n", "<leader>y]", "<Plug>(YankyCycleForward)", opts)
keymap("n", "<leader>y[", "<Plug>(YankyCycleBackward)", opts)

-- Short keys for grep searching
keymap('n', '\\g', ':grep <C-R>=expand("<cword>")<CR>', opts)
keymap('n', '\\s', ':grep <C-R>=expand("<cword>")<CR> %<CR>', opts)

-- Stop highlighting
-- keymap('n', '<leader>h', ':noh<CR>', opts)

-- Quickfix navigation
keymap('n', '<C-n>', ':cnext<CR>', opts)
keymap('n', '<C-p>', ':cprevious<CR>', opts)
keymap('n', '<C-L>', ':ccl \\| noh<C-R>=has(\'diff\')?\'<Bar>diffupdate\':\'\'<CR><CR><C-L>', opts)

-- Quickscope toggle
-- keymap('n', ']S', ':QuickScopeToggle<CR>', opts)
-- vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- Lazygit
keymap('', '<C-g>l', ':FloatermNew --width=0.9 --height=0.9 lazygit<CR>', opts)

-- Tab shortcuts
keymap('', 'Tn', ':tabnew<CR>', opts)

-- Undotree
keymap('n', ']U', ':UndotreeToggle<CR>', opts)

-- Doge generate
keymap('n', '<leader>d', ':DogeGenerate<CR>', opts)

-- Clangd Extensions
-- vim.cmd([[
--   nnoremap <silent> <space>g :ClangdAST<CR>
--   nnoremap <silent> <space>f :ClangdSwitchSourceHeader<CR>
--   nnoremap <silent> <space>t :ClangdToggleInlayHints<CR>
--   nnoremap <silent> <space>i :ClangdSymbolInfo<CR>
--   nnoremap <silent> <space>h :ClangdTypeHierarchy<CR>
--   ]])

-- Helpers
vim.api.nvim_exec([[
fun! ERLN()
  :set number relativenumber
  :set nu rnu
  :set signcolumn=yes
endfun

fun! DRLN()
  :set number norelativenumber
  :set nornu
  :set signcolumn=yes
endfun

command! -nargs=0 EnableRelativeLineNumbers call ERLN()
command! -nargs=0 DisableRelativeLineNumbers call DRLN()
nnoremap ]r :EnableRelativeLineNumbers<CR>
nnoremap [r :DisableRelativeLineNumbers<CR>
]], false)

-- <prefix>s 	find all references to the token under cursor
-- <prefix>g 	find global definition(s) of the token under cursor
-- <prefix>c 	find all calls to the function name under cursor
-- <prefix>t 	find all instances of the text under cursor
-- <prefix>e 	egrep search for the word under cursor
-- <prefix>f 	open the filename under cursor
-- <prefix>i 	find files that include the filename under cursor
-- <prefix>d 	find functions that function under cursor calls
-- <prefix>a 	find places where this symbol is assigned a value
-- <prefix>b 	build cscope database
vim.keymap.set(
  "n",
  "\\cs",
  [[<cmd>lua require('cscope_maps').cscope_prompt('s', vim.fn.expand("<cword>"))<cr>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "\\cg",
  [[<cmd>lua require('cscope_maps').cscope_prompt('g', vim.fn.expand("<cword>"))<cr>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "\\cc",
  [[<cmd>lua require('cscope_maps').cscope_prompt('c', vim.fn.expand("<cword>"))<cr>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "\\ce",
  [[<cmd>lua require('cscope_maps').cscope_prompt('e', vim.fn.expand("<cword>"))<cr>]],
  { noremap = true, silent = true }
)
