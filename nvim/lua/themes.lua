vim.cmd([[
if has('termguicolors')
  set termguicolors
endif

set noshowmode

let g:gruvbox_material_palette = "material"
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1

let g:gruvbox_material_statusline_style = "material"
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_diagnostic_virtual_text = 'colored'

let g:gruvbox_material_better_performance = 1

let g:gruvbox_material_transparent_background = 1

let g:presence_blacklist = [".config", "sofsafe"]

colorscheme gruvbox-material

let g:goyo_width = 150

let g:Hexokinase_highlighters = ['backgroundfull']

" Highlight current line number
set cursorline
highlight clear CursorLine
]])

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvmat',
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
