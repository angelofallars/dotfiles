call plug#begin()
" Discord Rich Presence (The most important plugin)
Plug 'vimsence/vimsence'

" LSP IDE features
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Emmet autocomplete
Plug 'mattn/emmet-vim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Gruvbox baby!
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

" Pretty status line
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Show added, modified and removed lines
Plug 'airblade/vim-gitgutter'

" Show git branch and add :Git command
Plug 'tpope/vim-fugitive'

" HTML close tag
Plug 'alvan/vim-closetag'

" CSS coloring
Plug 'ap/vim-css-color'

" Prettier format for web dev
Plug 'prettier/vim-prettier', {
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Markdown editors
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

call plug#end()

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1


if has('termguicolors')
  set termguicolors
endif

colorscheme gruvbox-material

let g:gruvbox_material_palette = "mix"
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_sign_column_background = 'none'

let g:gruvbox_material_statusline_style = "mix"
let g:gruvbox_material_diagnostic_line_highlight = 1

" Vimsence (Discord Rich Presence) options
let g:vimsence_small_text = 'Neovim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Workspace: {}'
" Rich presence text on large image
let g:presence_neovim_image_text   = "I use Neovim btw"

set autochdir
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile
set textwidth=80
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
}, {
  { name = 'buffer' },
})
})

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Setup the language servers
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
EOF

" Airline setup
" let g:airline#extensions#ale#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
"let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.linenr = ''
let g:airline_symbols.colnr = '::'
let g:airline_symbols.maxlinenr = ''
" Disable display of text encoding
let g:airline_section_y = ''
" let g:airline_section_z = airline#section#create_right(['linenr', 'maxlinenr'])

" Do not draw separators for empty sections
let g:airline_skip_empty_sections = 1

let g:airline_theme='gruvbox_material'

" FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Change window title to Neovim
let &titlestring = "Neovim"
set title

let $FZF_DEFAULT_OPTS="--preview='source-highlight --failsafe --out-format=esc -o STDOUT -i {}' --layout reverse"

" NerdTree
" let NERDTreeMinimalUI=1

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

" Indent width for C (the Unix Way)
autocmd FileType c setlocal shiftwidth=8 tabstop=8

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
