-- Toggle Zen mode
vim.keymap.set("n", "[Z", function()
  require("zen-mode").setup {
    window = {
      width = 90,
      options = {}
    },
  }
  require("zen-mode").toggle()
  vim.wo.wrap = false
  vim.wo.number = true
  vim.wo.rnu = true
end)

-- No line numbers
vim.keymap.set("n", "]Z", function()
  require("zen-mode").setup {
    window = {
      width = 80,
      options = {}
    },
  }
  require("zen-mode").toggle()
  vim.wo.wrap = false
  vim.wo.number = false
  vim.wo.rnu = false
  vim.opt.colorcolumn = "0"
end)
