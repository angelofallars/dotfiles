local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	local packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

local packer_status, packer = pcall(require, "packer")
if not packer_status then
	return
end
packer.init({
	git = {
		clone_timeout = 600,
	},
})

local plugins = function(use)

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

  use 'andweeb/presence.nvim'

  use 'sainnhe/gruvbox-material'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'

  use 'Yggdroot/indentLine'

  -- Show added, modified and removed lines
  use 'lewis6991/gitsigns.nvim'

  -- Show git branch and add :Git command
  use 'tpope/vim-fugitive'

  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  -- Autopairs
  use 'jiangmiao/auto-pairs'

  -- HTML close tag
  use {'alvan/vim-closetag',  ft = 'html' }
  -- CSS coloring
  use { 'RRethy/vim-hexokinase', run = 'make hexokinase' }
  use 'mattn/emmet-vim'
  use { 'prettier/vim-prettier',
    cmd = 'yarn install --frozen-lockfile --production',
    ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'} }

  use 'junegunn/goyo.vim'

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'p00f/nvim-ts-rainbow'

  use {'fatih/vim-go',  run = ':GoUpdateBinaries' }
  use 'rust-lang/rust.vim'

  use 'linty-org/readline.nvim'

  use 'rainbowhxch/beacon.nvim'

  use 'stevearc/dressing.nvim'

  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'rcarriga/cmp-dap'

end

local config = {
	display = {
		open_fn = require("packer.util").float,
	}
}

return packer.startup({
	plugins,
	config = config,
})
