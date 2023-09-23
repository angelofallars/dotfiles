require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        -- treesitter = true, 
        -- ts_rainbow = true, 
        harpoon = true, 
        notify = false,
        mini = false,
        fidget = true,
        indent_blankline = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
          },
          underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
          },
          inlay_hints = {
              background = true,
        },
},
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

vim.cmd.colorscheme "catppuccin"

-- local function highlight_line_number()
--   vim.opt.cursorline=true
--   vim.cmd([[ highlight clear CursorLine ]])
-- end
-- highlight_line_number()

-- vim.cmd([[ highlight FloatBorder guibg=NONE ]])
-- vim.cmd([[ highlight NormalFloat guibg=NONE ]])

-- vim.cmd([[highlight CmpCurrentLine guibg=#a9b665 guifg=#282828]])
--
-- vim.cmd([[highlight! link CmpNormal normal]])
-- vim.cmd([[highlight CmpBorder guifg=#5a524c]])
--
-- vim.cmd([[highlight CmpDocNormal guibg=#242322]])
-- vim.cmd([[highlight link CmpDocBorder CmpBorder]])
--
-- vim.cmd([[highlight! link FloatBorder CmpBorder]])
--
-- vim.cmd([[highlight VertSplit guifg=#32302f]])
--
-- vim.cmd([[highlight NvimTreeNormal guibg=#242322]])
-- vim.cmd([[highlight NvimTreeWinSeparator guibg=#242322 guifg=#242322]])
-- vim.cmd([[highlight NvimTreeCursorLine guibg=#2a2a2a]])
-- vim.cmd([[highlight! link NvimTreeFolderIcon green]])
-- vim.cmd([[highlight! link NvimTreeFolderName green]])
--
-- vim.cmd([[highlight TelescopeNormal guibg=#242322]])
-- vim.cmd([[highlight TelescopeBorder guifg=#242322 guibg=#242322]])
--
-- vim.cmd([[highlight TelescopePromptNormal guibg=#32302f]])
-- vim.cmd([[highlight TelescopePromptBorder guifg=#32302f guibg=#32302f]])
-- vim.cmd([[highlight TelescopePromptTitle  guibg=#ea6962 guifg=#242322]])
-- vim.cmd([[highlight TelescopePromptPrefix guifg=#ea6962]])
--
-- vim.cmd([[highlight TelescopePreviewTitle guibg=#a9b665 guifg=#242322]])
--
-- vim.cmd([[highlight TelescopeSelection guibg=#32302f guifg=#E3CCA3]])
--
-- vim.cmd([[hi link FloatTitle blue]])
