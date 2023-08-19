local util = require 'lspconfig.util'

-- For improvements look at:
-- https://github.com/fitrh/init.nvim/blob/7127fbef569ee498b1cbfae62ef372050b07afbc/lua/lsp/config/clangd.lua
-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
local function switch_source_header(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local clangd_client = util.get_active_client_by_name(bufnr, 'clangd')
  local params = { uri = vim.uri_from_bufnr(bufnr) }
  if clangd_client then
    clangd_client.request('textDocument/switchSourceHeader', params, function(err, result)
      if err then
        error(tostring(err))
      end
      if not result then
        print 'Corresponding file cannot be determined'
        return
      end
      vim.api.nvim_command('edit ' .. vim.uri_to_fname(result))
    end, bufnr)
  else
    print 'method textDocument/switchSourceHeader is not supported by any servers active on the current buffer'
  end
end

local root_files = {
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac', -- AutoTools
}

local default_capabilities = {
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
  offsetEncoding = { 'utf-8', 'utf-16' },
}

return {
  default_config = {
    cmd = {
      -- see clangd --help-hidden
      "clangd",
      "--background-index",
      -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
      -- to add more checks, create .clang-tidy file in the root directory
      -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
      "--clang-tidy",
      "--completion-style=bundled",
      "--cross-file-rename",
      "--header-insertion=iwyu",
    },
    filetypes = { 'c', 'cpp', 'h', 'hpp', 'objc', 'objcpp', 'cuda', 'proto' },
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    capabilities = default_capabilities,
  },
  commands = {
    ClangdSwitchSourceHeader = {
      function()
        switch_source_header(0)
      end,
      description = 'Switch between source/header',
    },
  },
  docs = {
    description = [[
https://clangd.llvm.org/installation.html

- **NOTE:** Clang >= 11 is recommended! See [#23](https://github.com/neovim/nvim-lsp/issues/23).
- If `compile_commands.json` lives in a build directory, you should
  symlink it to the root of your source tree.
  ```
  ln -s /path/to/myproject/build/compile_commands.json /path/to/myproject/
  ```
- clangd relies on a [JSON compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html)
  specified as compile_commands.json, see https://clangd.llvm.org/installation#compile_commandsjson
]],
    default_config = {
      root_dir = [[
        root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
        )
      ]],
      capabilities = [[default capabilities, with offsetEncoding utf-8]],
    },
  },
}
