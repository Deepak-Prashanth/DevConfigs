-- vim.cmd.packadd('packer.nvim')
-- Install lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "\\" -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({

'tpope/vim-sensible',

-- Themes
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
{ 'folke/tokyonight.nvim', branch = 'main' },
-- TODO: Move to lua line
-- 'vim-airline/vim-airline',
-- 'vim-airline/vim-airline-themes',
{
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
},

-- Navigation
'preservim/tagbar',
'junegunn/fzf',
'junegunn/fzf.vim',
'tpope/vim-commentary',

-- Git
'tpope/vim-fugitive',
'lewis6991/gitsigns.nvim',

-- Treesitter
{'nvim-treesitter/nvim-treesitter', build = ":TSUpdate"},
'mrjones2014/nvim-ts-rainbow',
'nvim-treesitter/nvim-treesitter-context',

-- Quality of life
'folke/which-key.nvim',
'folke/zen-mode.nvim',
'karb94/neoscroll.nvim',
'itchyny/vim-cursorword',
'farmergreg/vim-lastplace',
'nathanaelkane/vim-indent-guides',
'ntpeters/vim-better-whitespace',
'mbbill/undotree',
'ThePrimeagen/harpoon',
{
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' }
},
{ 'nvim-telescope/telescope-fzf-native.nvim',
  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
},
'markonm/traces.vim',
'voldikss/vim-floaterm',
'tpope/vim-unimpaired',
'unblevable/quick-scope',
'rcarriga/nvim-notify',

-- Useful tools
'godlygeek/tabular',
'AndrewRadev/linediff.vim',

-- Documentation/Commenting
{
  'kkoomen/vim-doge',
  run = ':call doge#install()'
},
'preservim/nerdcommenter',

-- Rust
'rust-lang/rust.vim',
'simrat39/rust-tools.nvim',

-- C++
't-troebst/perfanno.nvim',
'dhananjaylatkar/cscope_maps.nvim',
'p00f/clangd_extensions.nvim',
{'neoclide/coc.nvim', branch = 'release'},
-- Configure shortcuts by looking at:
-- https://gist.github.com/dinhmai74/4fc774dfd69750ce9ed706620a5082a9

-- LSP related configs
{
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect

      require('lsp-zero.settings').preset({})
    end
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      -- The arguments for .extend() have the same shape as `manage_nvim_cmp`: 
      -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

      require('lsp-zero.cmp').extend()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero.cmp').action() 

      cmp.setup({
        mapping = {
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
      {'williamboman/mason.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live

      local lsp = require('lsp-zero')

      lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()
    end
  }
}
-- 'editorconfig/editorconfig-vim',
-- 'tpope/vim-dispatch',
-- 'tpope/vim-rsi',
-- 'scrooloose/nerdtree',
-- 'stefandtw/quickfix-reflector.vim'
-- 'roxma/nvim-yarp'
-- 'roxma/vim-hug-neovim-rpc'
-- 'mhinz/vim-startify' " Fancy start screen
-- 'dense-analysis/ale'
-- 'skywind3000/asyncrun.vim'
-- 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
-- 'chentoast/marks.nvim'
-- 'rcarriga/nvim-notify' " Notification popups
-- 'SirVer/ultisnips'
-- 'honza/vim-snippets'
-- 'justink/vim-sneak'

-- Plug 'andymass/vim-matchup' " https://github.com/andymass/vim-matchup
-- ^^ (Causes slow down on bigger files)
--
-- function! UpdateRemotePlugins(...)
--   " Needed to refresh runtime files
--   let &rtp=&rtp
--   UpdateRemotePlugins
-- endfunction
--
-- Disabled as not needed anymore
-- Plug 'wellle/context.vim'   " Context while code browsing
-- Plug 'mhinz/vim-signify'
-- Plug 'blueyed/vim-diminactive'
-- Plug 'luochen1990/rainbow' " https://github.com/luochen1990/rainbow
-- Plug 'simrat39/inlay-hints.nvim'
-- Plug 'liuchengxu/vim-clap'  " 👏 Modern performant fuzzy picker
-- Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': 'python' }
-- Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
-- Plug 'octol/vim-cpp-enhanced-highlight' " Better cpp highlighting
-- Plug 'jsfaint/gen_tags.vim'  "gnu global(aka gtags), backup for "ccls"
-- Plug 'morhetz/gruvbox'      " To make coc warning msgs look better
-- Plug 'jiangmiao/auto-pairs' " Autocomplete brackets
--
-- -----------------
--  TRY THESE LATER
-- -----------------
-- TODO: https://github.com/easymotion/vim-easymotion
-- Plug 'easymotion/vim-easymotion'
-- Plug 'simrat39/symbols-outline.nvim'
-- Plug 'liuchengxu/vista.vim'
-- https://github.com/vim-utils/vim-man
-- https://github.com/ggandor/lightspeed.nvim
-- https://github.com/justinmk/vim-sneak
-- https://github.com/junegunn/vim-easy-align
-- https://github.com/andmarti1424/sc-im
-- https://github.com/junegunn/myvim
-- https://github.com/amoffat/snake
-- https://github.com/vim-ctrlspace/vim-ctrlspace
-- https://github.com/jasonrudolph/keyboard
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
-- -------------------
-- Tried but not used
-- -------------------
-- Plug 'ryanoasis/vim-devicons' " Filetype glyphs for vim
-- Plug 'gauteh/vim-cppman' " CPP Documentation
-- Plug 'skywind3000/vim-quickui' " For Quick UI - https://github.com/skywind3000/vim-quickui
-- https://github.com/camspiers/lens.vim
-- Plug 'camspiers/lens.vim'
-- --------------------------
-- Other plugins to check out
-- https://github.com/tweekmonster/startuptime.vim
-- https://github.com/wakatime/vim-wakatime
-- https://github.com/skywind3000/asynctasks.vim
})
