local plugins = function(use)
	use("wbthomason/packer.nvim")

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lsp")
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.config.cmp")
		end,

		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			-- "lukas-reineke/lsp-format.nvim",

			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp-signature-help",

			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	})

	use({
		"ThePrimeagen/htmx-lsp",
	})

	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("plugins.config.dap")
		end,

		module = "dap",

		requires = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",

			"rcarriga/cmp-dap",

			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
		},
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.config.treesitter")
		end,
		run = ":TSUpdate",
		requires = { "p00f/nvim-ts-rainbow" },
	})

	use({
		"vrischmann/tree-sitter-templ",
	})

	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.config.telescope")
		end,
		module = "telescope",
		requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	})

	use({
		"kyazdani42/nvim-web-devicons",
	})

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.config.nvim-tree")
		end,
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFileToggle" },
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	use({
		"ThePrimeagen/harpoon",
		module = "harpoon",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.config.gitsigns")
		end,
	})

	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("neogit").setup()
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		module = "Comment",
		keys = { "gc", "gb" },
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"NvChad/nvterm",
		config = function()
			require("plugins.config.nvterm")
		end,
	})

	use("linty-org/readline.nvim")

	-- Write distraction-free in Vim
	use({
		"junegunn/goyo.vim",
		cmd = "Goyo",
	})

	-- use({
	-- 	"fatih/vim-go",
	-- 	run = ":GoUpdateBinaries",
	-- 	ft = { "go" },
	-- })

	use({
		"alvan/vim-closetag",
		ft = "html",
	})

	-- emmet for vim: https://emmet.io
	use({
		"mattn/emmet-vim",
		ft = { "html" },
	})

	use({
		"prettier/vim-prettier",
		run = "yarn install --frozen-lockfile --production",
		ft = {
			"javascript",
			"typescript",
			"css",
			"less",
			"scss",
			"json",
			"graphql",
			"markdown",
			"vue",
			"svelte",
			"yaml",
			"html",
		},
	})

	-- Show projects and files in Discord status
	use({
		"andweeb/presence.nvim",
		config = function()
			require("plugins.config.presence")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.config.lualine")
		end,
		requires = { "kyazdani42/nvim-web-devicons", "catppuccin/nvim" },
	})

	-- Show colors for color names and hex codes
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- Display indent lines
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.config.indent_blankline")
		end,
	})

	-- Show LSP progress
	use({
		"j-hui/fidget.nvim",
		after = "nvim-lspconfig",
		tag = "legacy",
		config = function()
			require("plugins.config.fidget")
		end,
	})

	use({
		"simrat39/rust-tools.nvim",
	})

	-- Improve default Vim UI interfaces
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("plugins.config.dressing")
		end,
	})

	-- Improve startup time for Neovim
	use("lewis6991/impatient.nvim")

	use("dstein64/vim-startuptime")

	use("wuelnerdotexe/vim-astro")

	use("averms/black-nvim")

	-- Improve default Vim UI interfaces
	use({
		"NTBBloodbath/rest.nvim",
		config = function()
			require("plugins.config.rest-nvim")
		end,
	})

	use({
		"samueljoli/hurl.nvim",
		config = function()
			require("hurl").setup()
		end,
	})

	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("plugins.config.barbecue")
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins.config.which-key")
		end,
	})

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("plugins.config.catppuccin")
		end,
	})

	use({
		"stevearc/conform.nvim",
		config = function()
			require("plugins.config.conform")
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
end

require("core.packer").run(plugins)
