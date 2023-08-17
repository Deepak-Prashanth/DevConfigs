require("perfanno").setup {
    -- List of highlights that will be used to highlight hot lines (or nil to disable highlighting)
    line_highlights = nil,
    -- Highlight used for virtual text annotations (or nil to disable virtual text)
    vt_highlight = nil,

    -- Annotation formats that can be cycled between via :PerfCycleFormat
    --   "percent" controls whether percentages or absolute counts should be displayed
    --   "format" is the format string that will be used to display counts / percentages
    --   "minimum" is the minimum value below which lines will not be annotated
    -- Note: this also controls what shows up in the telescope finders
    formats = {
        {percent = true, format = "%.2f%%", minimum = 0.5},
        {percent = false, format = "%d", minimum = 1}
    },

    -- Automatically annotate files after :PerfLoadFlat and :PerfLoadCallGraph
    annotate_after_load = true,
    -- Automatically annotate newly opened buffers if information is available
    annotate_on_open = true,

    -- Options for telescope-based hottest line finders
    telescope = {
        -- Enable if possible, otherwise the plugin will fall back to vim.ui.select
        enabled = pcall(require, "telescope"),
        -- Annotate inside of the preview window
        annotate = true,
    },

    -- Node type patterns used to find the function that surrounds the cursor
    ts_function_patterns = {
        -- These should work for most languages (at least those used with perf)
        default = {
            "function",
            "method",
        },
        -- Otherwise you can add patterns for specific languages like:
        -- weirdlang = {
        --     "weirdfunc",
        -- }
    }
}

local telescope = require("telescope")
local actions = telescope.extensions.perfanno.actions
telescope.setup {
    extensions = {
        perfanno = {
            -- Special mappings in the telescope finders
            mappings = {
                ["i"] = {
                    -- Find hottest callers of selected entry
                    ["<C-h>"] = actions.hottest_callers,
                    -- Find hottest callees of selected entry
                    ["<C-l>"] = actions.hottest_callees,
                },

                ["n"] = {
                    ["gu"] = actions.hottest_callers,
                    ["gd"] = actions.hottest_callees,
                }
            }
        },
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local perfanno = require("perfanno")
local util = require("perfanno.util")

-- local bgcolor = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg", "gui")
local bgcolor = "#01BB01"

perfanno.setup {
    -- Creates a 10-step RGB color gradient beween bgcolor and "#CC3300"
    line_highlights = util.make_bg_highlights(bgcolor, "#CC3311", 10),
    vt_highlight = util.make_fg_highlight("#CC3311"),
}

local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

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

