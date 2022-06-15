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

-- Auto-compile the packer config on every save
vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

local plugins = function(use)
  use 'wbthomason/packer.nvim'

  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lsp') end,
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.cmp') end,

    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp-signature-help',

      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets',
    }
  }

  use {
    'mfussenegger/nvim-dap',
    config = function() require('plugins.dap') end,
    requires = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',

      'rcarriga/cmp-dap',

      'mfussenegger/nvim-dap-python',
      'leoluz/nvim-dap-go',
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate',
    requires = { 'p00f/nvim-ts-rainbow' }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use {
    'ThePrimeagen/harpoon',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end,
  }

  use 'tpope/vim-fugitive'

  use 'tpope/vim-surround'

  use 'tpope/vim-commentary'

  use 'jiangmiao/auto-pairs'

  use 'linty-org/readline.nvim'

  -- Write distraction-free in Vim
  use 'junegunn/goyo.vim'

  use 'rust-lang/rust.vim'

  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries'
  }

  use {
    'alvan/vim-closetag',
    ft = 'html'
  }

  -- emmet for vim: https://emmet.io
  use 'mattn/emmet-vim'

  use {
    'prettier/vim-prettier',
    cmd = 'yarn install --frozen-lockfile --production',
    ft = {
      'javascript', 'typescript', 'css', 'less', 'scss', 'json',
      'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'
    }
  }

  -- Show projects and files in Discord status
  use {
    'andweeb/presence.nvim',
    config = function() require('plugins.presence') end,
  }

  use {
    'sainnhe/gruvbox-material',
    config = function() require('plugins.gruvbox_material') end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('plugins.lualine') end,
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Show colors for color names and hex codes
  use {
    'RRethy/vim-hexokinase',
    run = 'make hexokinase'
  }

  -- Display indent lines
  use 'Yggdroot/indentLine'

  -- Flash cursorline on distanced jumps
  use 'rainbowhxch/beacon.nvim'

  -- Improve default Vim UI interfaces
  use 'stevearc/dressing.nvim'
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
