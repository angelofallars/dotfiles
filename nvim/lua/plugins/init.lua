require("lazy").setup({
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lsp")
		end,
		opts = {
			inlay_hints = { enabled = true },
		},
	},

	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.config.cmp")
		end,

		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp-signature-help",

			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		lazy = true,
	},

	{
		"hrsh7th/cmp-cmdline",
		lazy = true,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.config.treesitter")
		end,
		build = ":TSUpdate",
		dependencies = { "p00f/nvim-ts-rainbow" },
	},

	{
		"vrischmann/tree-sitter-templ",
		ft = "templ",
		lazy = true,
	},

	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.config.telescope")
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
		lazy = true,
	},

	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("plugins.config.nvim-tree")
		end,
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFileToggle" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			lazy = true,
		},
		lazy = true,
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		lazy = true,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.config.gitsigns")
		end,
	},

	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{
		"alvan/vim-closetag",
		ft = "html",
		lazy = true,
	},

	{
		"mattn/emmet-vim",
		ft = { "html" },
		lazy = true,
	},

	{
		"andweeb/presence.nvim",
		config = function()
			require("plugins.config.presence")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.config.lualine")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- TODO: fix config for fidget.nvim
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("plugins.config.fidget")
		end,
		enabled = true,
	},

	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		config = function()
			require("plugins.config.rust-tools")
		end,
		lazy = true,
	},

	{
		"stevearc/dressing.nvim",
		config = function()
			require("plugins.config.dressing")
		end,
	},

	{
		"wuelnerdotexe/vim-astro",
		ft = "astro",
		lazy = true,
	},

	{
		"samueljoli/hurl.nvim",
		config = function()
			require("hurl").setup()
		end,
		ft = "hurl",
		lazy = true,
	},

	{
		"utilyre/barbecue.nvim",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("plugins.config.barbecue")
		end,
	},

	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("plugins.config.catppuccin")
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins.config.conform")
		end,
		lazy = true,
		event = "BufWritePre",
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("plugins.config.nvim-lint")
		end,
		lazy = false,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.cmd([[
      let g:mkdp_auto_close = 1
      let g:mkdp_theme = 'dark'
      ]])
		end,
		ft = { "markdown" },
		lazy = true,
	},

	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
	},

	{
		"echasnovski/mini.indentscope",
		version = "*",
		config = function()
			vim.opt.list = true

			local symbol = "▏"

			vim.opt.listchars = {
				leadmultispace = symbol .. " ",
				tab = symbol .. " ",
				eol = "↴",
			}

			require("mini.indentscope").setup({
				draw = {
					animation = require("mini.indentscope").gen_animation.none(),
				},
				symbol = symbol,
			})
		end,
	},

	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {
			disabled_keys = {
				-- My split keyboard with the colemak-dh layout has a layer
				-- that maps the arrow keys to the original HJKL positions
				["<Up>"] = {},
				["<Down>"] = {},
				["<Left>"] = {},
				["<Right>"] = {},
			},
			restricted_keys = {
				["<Up>"] = { "n", "x" },
				["<Down>"] = { "n", "x" },
				["<Left>"] = { "n", "x" },
				["<Right>"] = { "n", "x" },
				["<C-N>"] = {},
				["<C-P>"] = {},
			},
		},
	},
	{
		"nvim-focus/focus.nvim",
		config = function()
			require("focus").setup({
				ui = {},
			})
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local HEIGHT_RATIO = 0.4 -- You can change this
			local WIDTH_RATIO = 0.20 -- You can change this too
			local screen_w = vim.opt.columns:get()
			local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
			local window_w = screen_w * WIDTH_RATIO
			local window_h = screen_h * HEIGHT_RATIO
			local window_w_int = math.max(35, math.floor(window_w))
			local window_h_int = math.max(20, math.floor(window_h))

			vim.cmd([[
      autocmd FileType oil setlocal nonumber norelativenumber
      ]])

			require("oil").setup({
				float = {
					padding = 10,
					border = { " ", " ", " ", " ", " ", " ", " ", " " },
					max_width = window_w_int,
					max_height = window_h_int,
				},
				keymaps = {
					["<CR>"] = "actions.parent",
					["<C-e>"] = "k",
					["<C-n>"] = "j",
					["<C-i>"] = "actions.select",
					["<C-o>"] = "actions.select_vsplit",
					["<C-u>"] = "actions.close",
				},
			})
			vim.keymap.set("n", "<C-n>", function()
				require("oil").toggle_float(".")
			end)
		end,
	},

	{
		"echasnovski/mini.files",
		version = false,
		config = function()
			require("mini.files").setup()
		end,
	},
})
