vim.g.gruvbox_material_palette                   = "material"
vim.g.gruvbox_material_statusline_style          = "material"

vim.g.gruvbox_material_enable_bold               = 1
vim.g.gruvbox_material_enable_italic             = 1

vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text   = 'colored'

vim.g.gruvbox_material_better_performance        = 1
vim.g.gruvbox_material_transparent_background    = 1

vim.cmd([[colorscheme gruvbox-material]])

local function highlight_line_number()
  vim.opt.cursorline=true
  vim.cmd([[ highlight clear CursorLine ]])
end
highlight_line_number()

vim.cmd([[ highlight FloatBorder guibg=NONE ]])
vim.cmd([[ highlight NormalFloat guibg=NONE ]])

vim.cmd([[highlight CmpCurrentLine guibg=#a9b665 guifg=#282828]])

vim.cmd([[highlight! link CmpNormal normal]])
vim.cmd([[highlight CmpBorder guifg=#5a524c]])

vim.cmd([[highlight CmpDocNormal guibg=#242322]])
vim.cmd([[highlight link CmpDocBorder CmpBorder]])

vim.cmd([[highlight! link FloatBorder CmpBorder]])

vim.cmd([[highlight VertSplit guifg=#32302f]])

vim.cmd([[highlight NvimTreeNormal guibg=#242322]])

vim.cmd([[highlight TelescopeNormal guibg=#242322]])
vim.cmd([[highlight TelescopeBorder guifg=#242322 guibg=#242322]])

vim.cmd([[highlight TelescopePromptNormal guibg=#32302f]])
vim.cmd([[highlight TelescopePromptBorder guifg=#32302f guibg=#32302f]])
vim.cmd([[highlight TelescopePromptTitle  guibg=#ea6962 guifg=#242322]])
vim.cmd([[highlight TelescopePromptPrefix guifg=#ea6962]])

vim.cmd([[highlight TelescopePreviewTitle guibg=#a9b665 guifg=#242322]])

vim.cmd([[highlight TelescopeSelection guibg=#32302f guifg=#E3CCA3]])
