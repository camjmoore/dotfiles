local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "vim" },
  map_c_h = true,
  map_c_w = true,
  fast_wrap = {
    map = "<M-e>",
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr'
  },
})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
