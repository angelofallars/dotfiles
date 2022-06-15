vim.cmd ([[packadd packer.nvim]])

return require('packer').startup(function()

use 'andweeb/presence.nvim'

-- LSP IDE features
use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'onsails/lspkind-nvim'

use 'hrsh7th/cmp-nvim-lsp-signature-help'

use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/vim-vsnip'

use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'ThePrimeagen/harpoon'
use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

use 'rafamadriz/friendly-snippets'

-- Gruvbox baby!
use 'sainnhe/gruvbox-material'

use 'nvim-lualine/lualine.nvim'
-- If you want to have icons in your statusline choose one of these
use 'kyazdani42/nvim-web-devicons'

-- Show added, modified and removed lines
use 'airblade/vim-gitgutter'

-- Show git branch and add :Git command
use 'tpope/vim-fugitive'
use 'tpope/vim-surround'
use 'tpope/vim-commentary'

-- ----
-- Autopairs
use 'jiangmiao/auto-pairs'

-- HTML close tag
use {'alvan/vim-closetag',  ft = 'html' }

-- CSS coloring
use { 'RRethy/vim-hexokinase', run = 'make hexokinase' }

use 'mattn/emmet-vim'

-- ----
use 'rust-lang/rust.vim'

-- post install (yarn install | npm install) then load plugin only for editing supported files
use { 'prettier/vim-prettier',
    cmd = 'yarn install --frozen-lockfile --production',
    ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'} }

use 'simrat39/symbols-outline.nvim'

use 'Yggdroot/indentLine'

use 'junegunn/goyo.vim'

use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

use 'p00f/nvim-ts-rainbow'

use {'fatih/vim-go',  run = ':GoUpdateBinaries' }

use 'linty-org/readline.nvim'

use 'rainbowhxch/beacon.nvim'

use 'mfussenegger/nvim-dap'
use 'mfussenegger/nvim-dap-python'
use 'leoluz/nvim-dap-go'
use 'rcarriga/nvim-dap-ui'
use 'theHamsta/nvim-dap-virtual-text'
use 'rcarriga/cmp-dap'

use 'stevearc/dressing.nvim'
end)
