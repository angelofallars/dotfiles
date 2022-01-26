call plug#begin()
" Discord Rich Presence (The most important plugin)
" Plug 'vimsence/vimsence'

" LSP IDE features
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Emmet autocomplete
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Gruvbox baby!
" Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

" Pretty status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show added, modified and removed lines
Plug 'airblade/vim-gitgutter'

" Show git branch and add :Git command
Plug 'tpope/vim-fugitive'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" HTML close tag
Plug 'alvan/vim-closetag', { 'for': 'html' }

" CSS coloring
Plug 'ap/vim-css-color', { 'for': ['css', 'sass', 'scss', 'less'] }

" Prettier format for web dev
" Plug 'prettier/vim-prettier', {
  " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Jinja syntax highlighting for flask
" Plug 'lepture/vim-jinja', { 'for': 'html' }


call plug#end()

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

colorscheme gruvbox-material

" Vimsence (Discord Rich Presence) options
" let g:vimsence_small_text = 'Neovim'
" let g:vimsence_small_image = 'neovim'
" let g:vimsence_editing_details = 'Editing: {}'
" let g:vimsence_editing_state = 'Workspace: {}'
" Rich presence text on large image
" let g:presence_neovim_image_text   = "I use Neovim btw"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

set autochdir
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile
set textwidth=0
set ai
set colorcolumn=80
set updatetime=500

set ignorecase
set smartcase

" Blinking cursor
set guicursor+=n-v-c-i:blinkon5

set completeopt=menu,menuone,noselect

lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  end,
},
mapping = {
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.close(),
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

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig').pylsp.setup {
    capabilities = capabilities
}

-- Setup the language servers
require'lspconfig'.bashls.setup {
    capabilities = capabilities
}
require('lspconfig').clangd.setup {
    capabilities = capabilities
}
require('lspconfig').pylsp.setup {
    capabilities = capabilities
}
require('lspconfig').pyright.setup{
    capabilities = capabilities
}
require('lspconfig').html.setup {
    capabilities = capabilities
}
require('lspconfig').cssls.setup {
    capabilities = capabilities
}
require('lspconfig').jsonls.setup {
  capabilities = capabilities,
}
require('lspconfig').tsserver.setup {
    capabilities = capabilities
}
require('lspconfig').eslint.setup {
    capabilities = capabilities
}
require('lspconfig').sqlls.setup {
    cmd = {"/usr/bin/sql-language-server", "up", "--method", "stdio"},
    capabilities = capabilities,
}
require'lspconfig'.vimls.setup{
    capabilities = capabilities
}
require'lspconfig'.rust_analyzer.setup{
    capabilities = capabilities
}
EOF

" Airline setup
" let g:airline#extensions#ale#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.colnr = '::'
let g:airline_symbols.maxlinenr = ''
" Disable display of text encoding
let g:airline_section_y = ''
" let g:airline_section_z = airline#section#create_right(['linenr', 'maxlinenr'])

" Do not draw separators for empty sections
let g:airline_skip_empty_sections = 1

let g:airline_theme='gruvbox_material'

" FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Change window title to Neovim
let &titlestring = "Neovim"
set title

let $FZF_DEFAULT_OPTS="--preview='source-highlight --failsafe --out-format=esc -o STDOUT -i {}' --layout reverse"

" Change current directory based on current buffer
autocmd BufEnter * silent! lcd %:p:h

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

let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
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

" Indent width for C (the Unix Way)
autocmd FileType c setlocal shiftwidth=8 tabstop=8

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

highlight ColorColumn guibg=#504945
