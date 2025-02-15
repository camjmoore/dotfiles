require('config.options')
require('config.keymap')
require('config.lazy')
-- require('config.export_colors')

-- terminal defaults
vim.api.nvim_create_autocmd("TermOpen", {
    pattern ="*",
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

-- Run gofmt + goimports on save - should probably put this autocmd in its own go.lua file in an nvim/after folder
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

vim.cmd("colorscheme chiroptera")
