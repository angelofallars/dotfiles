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
