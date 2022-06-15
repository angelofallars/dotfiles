vim.cmd ([[
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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

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
]])
