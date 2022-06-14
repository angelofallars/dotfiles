call plug#begin()
Plug 'andweeb/presence.nvim'

" LSP IDE features
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'rafamadriz/friendly-snippets'

" Gruvbox baby!
Plug 'sainnhe/gruvbox-material'

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" Show added, modified and removed lines
Plug 'airblade/vim-gitgutter'

" Show git branch and add :Git command
Plug 'tpope/vim-fugitive'

" ----
" Autopairs
Plug 'jiangmiao/auto-pairs'

" HTML close tag
Plug 'alvan/vim-closetag', { 'for': 'html' }

" CSS coloring
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mattn/emmet-vim'

" ----
Plug 'rust-lang/rust.vim'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'simrat39/symbols-outline.nvim'

Plug 'Yggdroot/indentLine'

Plug 'junegunn/goyo.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'p00f/nvim-ts-rainbow'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'linty-org/readline.nvim'

Plug 'rainbowhxch/beacon.nvim'

Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/cmp-dap'

Plug 'stevearc/dressing.nvim'

call plug#end()

let g:AutoPairsShortcutBackInsert = ''

lua << END
local readline = require 'readline'
vim.keymap.set('!', '<M-f>', readline.forward_word)
vim.keymap.set('!', '<M-b>', readline.backward_word)
vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
vim.keymap.set('!', '<C-e>', readline.end_of_line)
vim.keymap.set('!', '<M-d>', readline.kill_word)
vim.keymap.set('!', '<C-w>', readline.backward_kill_word)
vim.keymap.set('!', '<C-k>', readline.kill_line)
vim.keymap.set('!', '<C-u>', readline.backward_kill_line)

vim.keymap.set('!', '<C-f>', '<Right>')
vim.keymap.set('!', '<C-b>', '<Left>')
vim.keymap.set('!', '<C-n>', '<Down>')  -- next-line
vim.keymap.set('!', '<C-p>', '<Up>')    -- previous-line

vim.keymap.set('!', '<C-d>', '<Delete>')  -- delete-char
vim.keymap.set('!', '<C-h>', '<BS>')      -- backward-delete-char
END


if has('termguicolors')
  set termguicolors
endif

set noshowmode

let g:gruvbox_material_palette = "material"
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_sign_column_background = 'none'

let g:gruvbox_material_statusline_style = "material"
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_diagnostic_virtual_text = 'colored'

let g:gruvbox_material_better_performance = 1

" Maintain transparency of terminal
let g:gruvbox_material_transparent_background = 1

let g:presence_blacklist = [".config", "sofsafe"]

let g:goyo_width = 150

let g:Hexokinase_highlighters = ['backgroundfull']

colorscheme gruvbox-material

" Highlight current line number
set cursorline
highlight clear CursorLine

let g:rustfmt_autosave = 1

set autochdir
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile
set textwidth=0
set ai
set colorcolumn=0
set updatetime=500
set wrap

set ignorecase
set smartcase

" Blinking cursor
set guicursor+=n-v-c-i:blinkon5

" set completeopt=menu,menuone,noselect

set nocompatible
filetype plugin on
syntax on

syntax enable                           " Enables syntax highlighing
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set cindent                             " C indentation
set number relativenumber               " Line numbers
set updatetime=300                      " Faster completion

lua <<EOF

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
      {"┏", "FloatBorder"},
      {"━", "FloatBorder"},
      {"┓", "FloatBorder"},
      {"┃", "FloatBorder"},
      {"┛", "FloatBorder"},
      {"━", "FloatBorder"},
      {"┗", "FloatBorder"},
      {"┃", "FloatBorder"},
}

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>m', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = border,
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
    })

    vim.cmd [[
      highlight! DiagnosticLineNrError guifg=#ea6962 gui=bold
      highlight! DiagnosticLineNrWarn  guifg=#d8a657 gui=bold
      highlight! DiagnosticLineNrInfo  guifg=#89b482 gui=bold
      highlight! DiagnosticLineNrHint  guifg=#a9b665 gui=bold

      sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
      sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
      sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
      sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
    ]]

    vim.diagnostic.config({
      virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x'
      }
    })
end

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
window = {
    completion = {
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃", },
        winhighlight = 'Normal:Normal,FloatBorder:green,CursorLine:Visual,Search:None', 
        },
    documentation = {
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃", },
        winhighlight = 'Normal:Normal,FloatBorder:grey,CursorLine:Visual,Search:None', 
        },
    },
snippet = {
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  end,
},
mapping = {
  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
  ['<C-d>'] = cmp.mapping.scroll_docs(4),
  ['<C-f>'] = cmp.mapping.scroll_docs(10),
  ['<C-b>'] = cmp.mapping.scroll_docs(-10),
  ['<C-n>'] = cmp.mapping.select_next_item(),
  ['<C-p>'] = cmp.mapping.select_prev_item(),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.close(),
  ['<C-j>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
},
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
      { name = "path" },
      { name = 'nvim_lsp_signature_help' }
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
sources = {
  { name = 'buffer' }
}
})

-- Use buffer source for `?`
cmp.setup.cmdline('?', {
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          vsnip = "[VSnip]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
      }),

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
}

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'pylsp', 'pyright', 'bashls', 'clangd',
                  'html', 'cssls', 'jsonls', 'tsserver',
                  'eslint', 'sqlls', 'vimls', 'rust_analyzer',
                  'dockerls', 'racket_langserver' }

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
  }
end

EOF

lua << END
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

require('telescope').load_extension('fzf')

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "rust", "javascript", "typescript",
                       "css", "scss", "python", "bash", "lua",
                       "cpp"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
      enable = true
  },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
END


let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      '!': "<!DOCTYPE html>\n"
\              ."<html lang=\"en\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

" Change current directory based on current buffer
" autocmd BufEnter * silent! lcd %:p:h

" Indent width on web dev languages
autocmd FileType html setlocal shiftwidth=2 tabstop=2 textwidth=120
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType sass setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType less setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType jsx setlocal shiftwidth=2 tabstop=2
autocmd FileType tsx setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType angular setlocal shiftwidth=2 tabstop=2

autocmd BufNewFile,BufRead *.njk set filetype=html
autocmd BufNewFile,BufRead *waybar/config set syntax=json
autocmd BufNewFile,BufRead *.rasi set syntax=css
autocmd BufNewFile,BufRead *dunstrc set filetype=ini

" Indent width for C (the Unix Way)
autocmd FileType c setlocal shiftwidth=8 tabstop=8

autocmd FileType go setlocal noexpandtab

autocmd FileType scheme set shiftwidth=2 tabstop=2

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Search for <files> in the git repository
nnoremap <C-p> :lua require'telescope.builtin'.git_files{show_untracked = true}<cr>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>l <cmd>!librewolf %<cr>

"Harpoon baby!
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<CR>

nnoremap <C-c> :noh<CR>:<Esc>

" Close buffer
nnoremap <C-q> :bd<cr>

" System clipboard Mappings
nnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>y "+y

autocmd BufEnter * silent! lcd %:p:h

" Debugger stuff

lua <<EOF

local ok, dap = pcall(require, "dap")
if not ok then return end

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-go').setup()

require("dapui").setup({
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      { id = "stacks", size = 0.25 },
      {
        id = "scopes",
        size = 0.30, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.20 },
      { id = "watches", size = 00.25 },
    },
    size = 50,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
    tray = {
    elements = { "repl", "console" },
    size = 12,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
})
require("nvim-dap-virtual-text").setup()

vim.keymap.set("n", "<M-f>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<M-j>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<M-k>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<M-l>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<M-v>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<M-b>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<M-n>", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<M-d>", ":lua require'dap'.repl.open()<CR>")

vim.keymap.set("n", "<M-t>", ":lua require'dapui'.toggle()<CR>")
vim.keymap.set("n", "<M-y>", ":lua require'dapui'.toggle('tray')<CR>")

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

EOF

command -nargs=* J    Git <args>

command -nargs=* Ja   Git add <args>
command -nargs=* Jaa  Git add . <args>
command -nargs=* Jrm  Git rm <args>
command -nargs=* Jm   Git commit <args>
command -nargs=* Jma  Git commit --all <args>

command -nargs=* Jps  Git push <args>
command -nargs=* Jpl  Git pull <args>
command -nargs=* Jf   Git fetch <args>

command -nargs=* Jpsu Git push -u origin main <args>

command -nargs=* Jr   Git remote <args>
command -nargs=* Jrv  Git remote --verbose <args>
command -nargs=* Jrao Git remote add origin <args>
command -nargs=* Jrso Git remote set-url origin <args>

command -nargs=* Js   Git status <args>
command -nargs=* Jl   Git log <args>
command -nargs=* Jd   Git diff <args>
command -nargs=* Jds  Git diff --staged <args>
command -nargs=* Jd1  Git diff diff HEAD~1 <args>
command -nargs=* Jd2  Git diff diff HEAD~2 <args>
command -nargs=* Jd3  Git diff diff HEAD~3 <args>

command -nargs=* Jb   Git branch <args>
command -nargs=* Jc  Git checkout <args>
