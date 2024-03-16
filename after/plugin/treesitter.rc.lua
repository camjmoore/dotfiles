local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = { 'org' },
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "clojure",
    "markdown",
    "markdown_inline",
    "javascript",
    "typescript",
    "tsx",
    "toml",
    "json",
    "yaml",
    "css",
    "html",
    "astro",
    "lua",
    "org"
  },
  autotag = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
