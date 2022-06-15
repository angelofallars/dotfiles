vim.cmd([[
if has('termguicolors')
  set termguicolors
endif
]])

vim.opt.showmode=false

vim.g.gruvbox_material_palette = "material"
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_statusline_style = "material"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1

vim.cmd([[colorscheme gruvbox-material]])
vim.opt.cursorline=true

vim.cmd([[highlight clear CursorLine]])

vim.g.Hexokinase_highlighters = {'backgroundfull'}

local custom_gruvbox_material = require'lualine.themes.sainnhegruv'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_gruvbox_material,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
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
}
