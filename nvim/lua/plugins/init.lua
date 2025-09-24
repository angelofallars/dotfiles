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
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node

			ls.add_snippets(
				"python",
				s("bp", {
					t("breakpoint()"),
				})
			)
		end,
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
		-- dependencies = { "HiPhish/rainbow-delimiters.nvim" },
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
		"vyfor/cord.nvim",
		build = ":Cord update",
		-- opts = {}
		config = function()
			require("plugins.config.cord")
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
		"catgoose/nvim-colorizer.lua",
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
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
		ft = "rust",
		config = function()
			require("plugins.config.rust-tools")
		end,
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
		"echasnovski/mini.indentscope",
		version = "*",
		config = function()
			local symbol = "▏"
			require("mini.indentscope").setup({
				draw = {
					delay = 0,
					animation = require("mini.indentscope").gen_animation.none(),
				},
				symbol = symbol,
				options = {
					try_as_border = true,
				},
			})
		end,
	},

	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	-- 	opts = {
	-- 		disabled_keys = {
	-- 			-- My split keyboard with the colemak-dh layout has a layer
	-- 			-- that maps the arrow keys to the original HJKL positions
	-- 			["<Up>"] = {},
	-- 			["<Down>"] = {},
	-- 			["<Left>"] = {},
	-- 			["<Right>"] = {},
	-- 		},
	-- 		restricted_keys = {
	-- 			["<Up>"] = { "n", "x" },
	-- 			["<Down>"] = { "n", "x" },
	-- 			["<Left>"] = { "n", "x" },
	-- 			["<Right>"] = { "n", "x" },
	-- 			["1j"] = { "n", "x" },
	-- 			["1k"] = { "n", "x" },
	-- 			["<C-N>"] = {},
	-- 			["<C-P>"] = {},
	-- 		},
	-- 	},
	-- },

	-- {
	-- 	"nvim-focus/focus.nvim",
	-- 	config = function()
	-- 		require("focus").setup({
	-- 			ui = {},
	-- 		})
	-- 	end,
	-- },

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
					["<C-i>"] = "actions.parent",
					["<C-p>"] = "k",
					["<C-n>"] = "j",
					["<C-o>"] = "actions.select_vsplit",
				},
			})
			-- vim.keymap.set("n", "<C-n>", function()
			-- 	require("oil").toggle_float(".")
			-- end)
		end,
	},

	-- {
	-- 	"echasnovski/mini.files",
	-- 	version = false,
	-- 	config = function()
	-- 		require("mini.files").setup()
	-- 	end,
	-- },

	{
		"rcarriga/nvim-notify",
		dependencies = { "catppuccin/nvim" },
		config = function()
			require("notify").setup({
				level = 0,
				render = "wrapped-compact",
				minimum_width = 40,
				fps = 165,
			})

			vim.cmd([[
            highlight link NotifyBackground Normal
            highlight link NotifyERRORBody Normal
            highlight link NotifyWARNBody Normal
            highlight link NotifyINFOBody Normal
            highlight link NotifyDEBUGBody Normal
            highlight link NotifyTRACEBody Normal
         ]])

			vim.notify = require("notify")
		end,
	},

	-- {
	-- 	"chrisgrieser/nvim-early-retirement",
	-- 	config = true,
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- Show notification on closing. Works with nvim-notify or noice.nvim
	-- 		notificationOnAutoClose = true,
	--
	-- 		-- when a file is deleted, for example via an external program, delete the
	-- 		-- associated buffer as well
	-- 		deleteBufferWhenFileDeleted = false,
	-- 	},
	-- },
	--

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{ "rescript-lang/vim-rescript", tag = "v2.1.0" },

	{ "projectfluent/fluent.vim" },

	{ "ccraciun/vim-dreammaker" },

	{ "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },

	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},

	-- {
	--    "iabdelkareem/csharp.nvim",
	--    dependencies = {
	--       "williamboman/mason.nvim", -- Required, automatically installs omnisharp
	--       "mfussenegger/nvim-dap",
	--       "Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
	--    },
	--    config = function ()
	--       require("mason").setup() -- Mason setup must run before csharp, only if you want to use omnisharp
	--       require("csharp").setup(
	--          {
	--             lsp = {
	--                -- Sets if you want to use omnisharp as your LSP
	--                omnisharp = {
	--                   -- When set to false, csharp.nvim won't launch omnisharp automatically.
	--                   enable = true,
	--                   -- The default timeout when communicating with omnisharp
	--                   default_timeout = 1000,
	--                   -- Settings that'll be passed to the omnisharp server
	--                   enable_editor_config_support = true,
	--                   organize_imports = true,
	--                   load_projects_on_demand = false,
	--                   enable_analyzers_support = true,
	--                   enable_import_completion = true,
	--                   include_prerelease_sdks = true,
	--                   analyze_open_documents_only = false,
	--                   enable_package_auto_restore = true,
	--                   -- Launches omnisharp in debug mode
	--                   debug = false,
	--                },
	--                -- Sets if you want to use roslyn as your LSP
	--                roslyn = {
	--                   -- When set to true, csharp.nvim will launch roslyn automatically.
	--                   enable = false,
	--                   -- Path to the roslyn LSP see 'Roslyn LSP Specific Prerequisites' above.
	--                   cmd_path = "/usr/bin/omnisharp",
	--                },
	--                -- The capabilities to pass to the omnisharp server
	--                capabilities = nil,
	--                -- on_attach function that'll be called when the LSP is attached to a buffer
	--                on_attach = nil
	--             },
	--          }
	--       )
	--    end
	-- }
})
