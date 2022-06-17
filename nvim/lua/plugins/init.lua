local plugins = function(use)
  use 'wbthomason/packer.nvim'

  use {
    'neovim/nvim-lspconfig',
    module = "lspconfig",
    config = function() require('plugins.config.lsp') end,
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.config.cmp') end,

    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp-signature-help',

      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    }
  }

  use {
    'mfussenegger/nvim-dap',
    config = function() require('plugins.config.dap') end,

    module = 'dap',

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
    config = function() require('plugins.config.treesitter') end,
    run = ':TSUpdate',
    requires = { 'p00f/nvim-ts-rainbow' }
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('plugins.config.telescope') end,
    module = "telescope",
    requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('plugins.config.nvim-tree') end,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    disable = true,
    run = 'make'
  }

  use {
    'ThePrimeagen/harpoon',
    module = 'harpoon',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.config.gitsigns') end,
  }

  use 'tpope/vim-fugitive'

  use {
    'tpope/vim-surround',
    keys = { "ds", "cs", "cS", "ys", "yS", "v" }
  }

  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end,
    module = "Comment",
    keys = { "gc", "gb" },
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use 'linty-org/readline.nvim'

  -- Write distraction-free in Vim
  use {
    'junegunn/goyo.vim',
    cmd = "Goyo",
  }

  use {
    'rust-lang/rust.vim',
    ft = { 'rust' },
  }

  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries',
    ft = { 'go' },
  }

  use {
    'alvan/vim-closetag',
    ft = 'html'
  }

  -- emmet for vim: https://emmet.io
  use {
    'mattn/emmet-vim',
    ft = { 'html' }
  }

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
    config = function() require('plugins.config.presence') end,
  }

  use {
    'sainnhe/gruvbox-material',
    config = function() require('plugins.config.gruvbox_material') end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('plugins.config.lualine') end,
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Show colors for color names and hex codes
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end,
  }

  -- Display indent lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.config.indent_blankline') end,
  }

  -- Show LSP progress
  use {
    'j-hui/fidget.nvim',
    config = function() require('plugins.config.fidget') end,
  }

  -- Flash cursorline on distanced jumps
  use 'rainbowhxch/beacon.nvim'

  -- Improve default Vim UI interfaces
  use {
    'stevearc/dressing.nvim',
    config = function() require('plugins.config.dressing') end,
  }

  -- Improve startup time for Neovim
  use 'lewis6991/impatient.nvim'

  use 'dstein64/vim-startuptime'
end

require("core.packer").run(plugins)
