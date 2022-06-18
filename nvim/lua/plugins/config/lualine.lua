local gruvbox_material = require'lualine.themes.gruvbox-material'

-- Get Git path of current file
local filename_custom = require'lualine.custom_component.filename'

-- Change color of diagnostics
vim.cmd([[
highlight! DiagnosticError guifg=#ea6962 gui=bold
highlight! DiagnosticWarn  guifg=#d8a657 gui=bold
highlight! DiagnosticInfo  guifg=#7daea3 gui=bold
highlight! DiagnosticHint  guifg=#a9b665 gui=bold
]])

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = gruvbox_material,
    section_separators = { left = '', right = '' },
    component_separators = "",
    disabled_filetypes = {
      "gitcommit"
    },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '', right = '' } },
    },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = { filename_custom },
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {
      { 'location', separator = { left = '', right = '' } },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})
