local status, ls = pcall(require, 'LuaSnip')
if not (status) then return end

local cmp_luasnip = require('cmp_luasnip')
local cmp = require('cmp')

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged, TextChangedI',
  enable_autosnippets = true,
})

cmp.event:on('confirm_done', cmp_luasnip.session_sync)
