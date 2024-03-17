-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  -- Git
  'tpope/vim-fugitive',

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "c", "cpp",
        "python",
        "rust",
        "lua", "vim", "vimdoc",
        "query", "sql",
        "bash", "make", "yaml",
        "toml",
      })
    end,
  },

  'mrjones2014/nvim-ts-rainbow',

  -- IDE Formatting
  'junegunn/fzf',
  'junegunn/fzf.vim',
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    'mvllow/modes.nvim',
    tag = 'v0.2.0',
    config = function()
      local latte = require("catppuccin.palettes").get_palette "mocha"
      require('modes').setup({
        colors = {
          visual = latte.mauve,
        },
      })
    end
  },
  'itchyny/vim-cursorword',
  'nathanaelkane/vim-indent-guides',
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,            -- Hide cursor while scrolling
        stop_eof = true,               -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,     -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true,   -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = 'quadratic', -- Default easing function
        pre_hook = nil,                -- Function to run before the scrolling animation starts
        post_hook = nil,               -- Function to run after the scrolling animation ends
        performance_mode = false,      -- Disable "Performance Mode" on all buffers.
      })
    end
  },
  'farmergreg/vim-lastplace',
  { 'mbbill/undotree',       lazy = true, cmd = 'UndotreeToggle' },
  { 'voldikss/vim-floaterm', lazy = true, cmd = 'FloatermNew' },
  'tpope/vim-unimpaired',
  'folke/zen-mode.nvim',
  {
    'natecraddock/sessions.nvim',
    config = function()
      require("sessions").setup()
    end
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      vim.cmd [[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
      ]]
    end,

  },
  {
    'wellle/targets.vim'
  },
  -- 'unblevable/quick-scope',
  -- {
  --   'b0o/incline.nvim',
  --   config = function()
  --     require('incline').setup()
  --   end
  -- },
  -- {'ggandor/leap.nvim'},
  {
    'fei6409/log-highlight.nvim',
    config = function()
      require('log-highlight').setup {}
    end,
  },

  -- C++ tools
  {
    'jakemason/ouroboros',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
    end,
    ft = { 'c', 'cpp', 'h', 'hpp', 'cxx', 'hxx'}
  },
  {
    -- Add the following fix to make it work.
    -- cd ~/.config/coc/extensions/node_modules/coc-ccls
    -- ln -s node_modules/ws/lib lib
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      vim.cmd [[
        let g:coc_config_home='~/.vim'
        let g:coc_data_home='~/.vim'
        source ~/.vim/coc-settings.vimrc
        " vim.g.coc_config_file = '$HOME/.vim/coc-settings.json'
        let g:coc_global_extensions = ['coc-pyright', 'coc-sql', 'coc-cmake']
      ]]
    end,
    ft = { 'c', 'cpp', 'h', 'hpp', 'cxx', 'hxx', 'python' }
  },
  { 't-troebst/perfanno.nvim',  lazy = true },
  {
    'dhananjaylatkar/cscope_maps.nvim',
    config = function()
      require('cscope_maps').setup({})
    end,
    opts = {
      disable_maps = false,
      skip_input_prompt = true,
      prefix = "\\c"
    },
    lazy = true,
    ft = { 'c', 'cpp', 'h', 'hpp', 'cxx', 'hxx' }
  },
  --   {
  --     'p00f/clangd_extensions.nvim',
  --     lazy = true,
  --     ft = { 'c', 'cpp', 'h', 'hpp', 'cxx', 'hxx' },
  --     config = function ()
  --       require('clangd_extensions').setup({
  --         extensions = {
  --         autoSetHints = true,
  --         inlay_hints = {
  --           inline = vim.fn.has("nvim-0.10") == 1,
  --           -- Options other than `highlight' and `priority' only work
  --           -- if `inline' is disabled
  --           -- Only show inlay hints for the current line
  --           only_current_line = true,
  --           -- Event which triggers a refresh of the inlay hints.
  --           -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
  --           -- not that this may cause  higher CPU usage.
  --           -- This option is only respected when only_current_line and
  --           -- autoSetHints both are true.
  --           only_current_line_autocmd = "CursorHold",
  --           -- whether to show parameter hints with the inlay hints or not
  --           show_parameter_hints = true,
  --           -- prefix for parameter hints
  --           parameter_hints_prefix = "⦂ ",
  --           -- prefix for all the other hints (type, chaining)
  --           other_hints_prefix = "➤  ",
  --           -- whether to align to the length of the longest line in the file
  --           max_len_align = false,
  --           -- padding from the left if max_len_align is true
  --           max_len_align_padding = 1,
  --           -- whether to align to the extreme right or not
  --           right_align = false,
  --           -- padding from the right if right_align is true
  --           right_align_padding = 2,
  --           -- The color of the hints
  --           highlight = "Comment",
  --           -- The highlight group priority for extmark
  --           priority = 100,
  --         },
  --         ast = {
  --           -- These are unicode, should be available in any font
  --           role_icons = {
  --             type = "🄣",
  --             declaration = "🄓",
  --             expression = "🄔",
  --             statement = ";",
  --             specifier = "🄢",
  --             ["template argument"] = "🆃",
  --           },
  --           kind_icons = {
  --             Compound = "🄲",
  --             Recovery = "🅁",
  --             TranslationUnit = "🅄",
  --             PackExpansion = "🄿",
  --             TemplateTypeParm = "🅃",
  --             TemplateTemplateParm = "🅃",
  --             TemplateParamObject = "🅃",
  --           },
  --       highlights = {
  --         detail = "Comment",
  --       },
  --     },
  --     memory_usage = {
  --       border = "none",
  --     },
  --     symbol_info = {
  --       border = "none",
  --     },
  --   }
  -- })
  --     end
  --   },
  -- C++ documentation/commenting
  {
    'kkoomen/vim-doge',
    build = function()
      vim.cmd [[call doge#install()]]
    end
  },

  -- Useful tools
  { 'godlygeek/tabular',        lazy = true, cmd = 'Tabularize' },
  { 'AndrewRadev/linediff.vim', lazy = true, cmd = 'Linediff' },

  -- Note taking into Obsidian
  {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },

    -- see below for full list of options 👇
  },
}

}
--
-- -- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
-- --
-- -- In your plugin files, you can:
-- -- * add extra plugins
-- -- * disable/enabled LazyVim plugins
-- -- * override the configuration of LazyVim plugins
-- return {
--   -- add gruvbox
--   { "ellisonleao/gruvbox.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
--
--   -- change trouble config
--   {
--     "folke/trouble.nvim",
--     -- opts will be merged with the parent spec
--     opts = { use_diagnostic_signs = true },
--   },
--
--   -- disable trouble
--   { "folke/trouble.nvim", enabled = false },
--
--   -- add symbols-outline
--   {
--     "simrat39/symbols-outline.nvim",
--     cmd = "SymbolsOutline",
--     keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
--     config = true,
--   },
--
--   -- override nvim-cmp and add cmp-emoji
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = { "hrsh7th/cmp-emoji" },
--     ---@param opts cmp.ConfigSchema
--     opts = function(_, opts)
--       table.insert(opts.sources, { name = "emoji" })
--     end,
--   },
--
--   -- change some telescope options and a keymap to browse plugin files
--   {
--     "nvim-telescope/telescope.nvim",
--     keys = {
--       -- add a keymap to browse plugin files
--       -- stylua: ignore
--       {
--         "<leader>fp",
--         function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
--         desc = "Find Plugin File",
--       },
--     },
--     -- change some options
--     opts = {
--       defaults = {
--         layout_strategy = "horizontal",
--         layout_config = { prompt_position = "top" },
--         sorting_strategy = "ascending",
--         winblend = 0,
--       },
--     },
--   },
--
--
--   -- add pyright to lspconfig
--   {
--     "neovim/nvim-lspconfig",
--     ---@class PluginLspOpts
--     opts = {
--       ---@type lspconfig.options
--       servers = {
--         -- pyright will be automatically installed with mason and loaded with lspconfig
--         pyright = {},
--       },
--     },
--   },
--
--   -- add tsserver and setup with typescript.nvim instead of lspconfig
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "jose-elias-alvarez/typescript.nvim",
--       init = function()
--         require("lazyvim.util").on_attach(function(_, buffer)
--           -- stylua: ignore
--           vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
--           vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
--         end)
--       end,
--     },
--     ---@class PluginLspOpts
--     opts = {
--       ---@type lspconfig.options
--       servers = {
--         -- tsserver will be automatically installed with mason and loaded with lspconfig
--         tsserver = {},
--       },
--       -- you can do any additional lsp server setup here
--       -- return true if you don't want this server to be setup with lspconfig
--       ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
--       setup = {
--         -- example to setup with typescript.nvim
--         tsserver = function(_, opts)
--           require("typescript").setup({ server = opts })
--           return true
--         end,
--         -- Specify * to use this function as a fallback for any server
--         -- ["*"] = function(server, opts) end,
--       },
--     },
--   },
--
--   -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
--   -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
--   { import = "lazyvim.plugins.extras.lang.typescript" },
--
--   -- add more treesitter parsers
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = {
--       ensure_installed = {
--         "bash",
--         "html",
--         "javascript",
--         "json",
--         "lua",
--         "markdown",
--         "markdown_inline",
--         "python",
--         "query",
--         "regex",
--         "tsx",
--         "typescript",
--         "vim",
--         "yaml",
--       },
--     },
--   },
--
--   -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
--   -- would overwrite `ensure_installed` with the new value.
--   -- If you'd rather extend the default config, use the code below instead:
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = function(_, opts)
--       -- add tsx and treesitter
--       vim.list_extend(opts.ensure_installed, {
--         "tsx",
--         "typescript",
--       })
--     end,
--   },
--
--   -- the opts function can also be used to change the default opts:
--   {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy",
--     opts = function(_, opts)
--       table.insert(opts.sections.lualine_x, "😄")
--     end,
--   },
--
--   -- or you can return new options to override all the defaults
--   {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy",
--     opts = function()
--       return {
--         --[[add your custom lualine config here]]
--       }
--     end,
--   },
--
--   -- use mini.starter instead of alpha
--   { import = "lazyvim.plugins.extras.ui.mini-starter" },
--
--   -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
--   { import = "lazyvim.plugins.extras.lang.json" },
--
--   -- add any tools you want to have installed below
--   {
--     "williamboman/mason.nvim",
--     opts = {
--       ensure_installed = {
--         "stylua",
--         "shellcheck",
--         "shfmt",
--         "flake8",
--       },
--     },
--   },
--
--   -- Use <tab> for completion and snippets (supertab)
--   -- first: disable default <tab> and <s-tab> behavior in LuaSnip
--   {
--     "L3MON4D3/LuaSnip",
--     keys = function()
--       return {}
--     end,
--   },
--   -- then: setup supertab in cmp
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "hrsh7th/cmp-emoji",
--     },
--     ---@param opts cmp.ConfigSchema
--     opts = function(_, opts)
--       local has_words_before = function()
--         unpack = unpack or table.unpack
--         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--       end
--
--       local luasnip = require("luasnip")
--       local cmp = require("cmp")
--
--       opts.mapping = vim.tbl_extend("force", opts.mapping, {
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--             -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
--             -- this way you will only jump inside the snippet region
--           elseif luasnip.expand_or_jumpable() then
--             luasnip.expand_or_jump()
--           elseif has_words_before() then
--             cmp.complete()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           elseif luasnip.jumpable(-1) then
--             luasnip.jump(-1)
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       })
--     end,
--   },
-- }
