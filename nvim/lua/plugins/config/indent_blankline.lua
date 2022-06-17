vim.opt.list = true

require("indent_blankline").setup {
  use_treesitter = true,
  char = "▏",
  filetype_exclude = {
    "help",
    "terminal",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "lsp-installer",
    "NvimTree",
    "gitcommit",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
}
