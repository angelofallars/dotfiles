local function hl_bg(name)
	return vim.api.nvim_get_hl(0, { name = name }).bg
end

local base_minus_1 = "#262637"

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = {},
		conditionals = {
			-- "italic"
		},
		loops = {
			-- "italic"
		},
		functions = {
			"bold",
		},
		keywords = {
			-- "italic"
		},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	custom_highlights = function(colors)
		return {
			WinSeparator = { fg = colors.surface1, style = { "bold" } },

			CursorLineNR = { fg = colors.lavender },
			CursorLine = { bg = base_minus_1 },

			LineNr = { fg = colors.surface1 },

			GitSignsAddNr = { fg = "#587270" },
			GitSignsChangeNr = { fg = "#66735f" },
			GitSignsDeleteNr = { fg = "#705a75" },

			GitCommitSummary = { fg = colors.green },

			FidgetTask = { fg = colors.surface2 },

			NormalFloat = { bg = colors.mantle, fg = colors.subtext1 },
			FloatBorder = { bg = colors.mantle, fg = base_minus_1, style = { "bold" } },

			TelescopeNormal = { bg = colors.mantle },
			TelescopeBorder = { bg = colors.mantle, fg = colors.mantle },

			TelescopePrompt = { bg = colors.surface1 },
			TelescopePromptNormal = { bg = colors.surface0 },
			TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
			TelescopePromptPrefix = { bg = colors.surface0, fg = colors.peach },

			TelescopePromptTitle = { bg = colors.peach, fg = colors.base, style = { "bold" } },
			TelescopeResultsTitle = { bg = colors.mantle, fg = colors.base, style = { "bold" } },
			TelescopePreviewTitle = { bg = colors.green, fg = colors.base, style = { "bold" } },

			TelescopeResults = { bg = colors.mantle },
			TelescopeResultsNormal = { bg = colors.mantle, fg = colors.subtext0 },
			TelescopeSelection = { bg = base_minus_1, fg = colors.lavender },
			TelescopeSelectionCaret = { bg = base_minus_1, fg = colors.lavender },
			TelescopeMatching = { fg = colors.green, style = { "bold", "underline" } },

			NvimTreeNormal = { bg = colors.mantle },
			NvimTreeNormalFloat = { bg = colors.mantle },

			NvimTreeOpenedFile = { fg = colors.yellow, style = { "bold" } },
			NvimTreeOpenedFileIcon = { fg = colors.peach, style = { "bold" } },

			NvimTreeIndentMarker = { fg = colors.surface1, style = { "bold" } },

			NvimTreeCursorLine = { bg = "#262637" },

			NvimTreeRootFolder = { fg = colors.red, style = { "bold" } },
			NvimTreeFolderIcon = { fg = colors.green },
			NvimTreeFolderName = { fg = colors.green },
			NvimTreeEmptyFolderName = { fg = colors.green },
			NvimTreeOpenedFolderName = { fg = colors.green },
			NvimTreeSymlinkFolderName = { fg = colors.green },

			NvimTreeFolderArrowClosed = { fg = colors.surface2, style = { "bold" } },
			NvimTreeFolderArrowOpen = { fg = colors.surface1 },

			CmpNormal = { bg = colors.surface0 },
			CmpBorder = { bg = colors.surface0, fg = colors.surface2, style = { "bold" } },
			CmpBorderTitle = { fg = colors.green, bg = colors.surface0, style = { "bold" } },
			CmpSelect = { bg = colors.surface1 },

			CmpItemAbbr = { fg = colors.subtext1 },
			CmpItemKindKeyword = { fg = colors.subtext1 },
			CmpItemAbbrMatch = { fg = colors.blue },

			CmpDocNormal = { bg = colors.mantle, fg = colors.subtext0 },
			CmpDocBorder = { bg = colors.mantle, fg = base_minus_1, style = { "bold" } },
			CmpDocBorderTitle = { fg = colors.green, bg = colors.mantle, style = { "bold" } },
			CmpDocSelect = { bg = colors.base },

			LspReferenceRead = { bg = colors.surface0 },
			LspReferenceText = { bg = colors.surface0 },
			LspReferenceWrite = { bg = colors.surface0 },
		}
	end,

	highlight_overrides = {
		all = function(colors)
			return {}
		end,
	},

	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = {
			enabled = true,
			style = "nvchad",
		},
		treesitter = true,
		-- treesitter_context = true,
		harpoon = true,
		notify = false,
		mini = false,
		fidget = true,
		which_key = true,
		noice = true,
		markdown = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		dap = {
			enabled = true,
			enable_ui = true, -- enable nvim-dap-ui
		},
		barbecue = {
			dim_dirname = true, -- directory name is dimmed by default
			bold_basename = true,
			dim_context = true,
			alt_background = false,
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

vim.opt.winblend = 5
vim.cmd.colorscheme("catppuccin")

vim.opt.cursorline = true

vim.cmd([[
hi NormalFloat blend=4
hi FloatBorder blend=4

hi CmpNormal blend=5
hi CmpBorder blend=5
hi CmpBorderTitle blend=5
hi CmpSelect blend=5

hi CmpDocNormal blend=5
hi CmpDocBorder blend=5
hi CmpDocBorderTitle blend=5
hi CmpDocSelect blend=5
]])
