local status, neorg = pcall(require, "nvim-neorg/neorg")
if (not status) then return end

neorg.setup {
  load = {
    ["core.defaults"] = {},  -- Loads default behaviour
    ["core.norg.concealer"] = {},
    ["core.norg.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes",
        },
      },
    },
  },
}
