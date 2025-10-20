-- Get Git path of current file
local filename_custom = require("lualine.custom_component.filename")
local custom_catppuccin = require("lualine.themes.catppuccin")

custom_catppuccin.insert.b.fg = "#a6e3a1"
custom_catppuccin.normal.c.fg = "#9399b2"

custom_catppuccin.normal.b.bg = "#313244"
custom_catppuccin.insert.b.bg = "#313244"
custom_catppuccin.visual.b.bg = "#313244"
custom_catppuccin.replace.b.bg = "#313244"
custom_catppuccin.terminal.b.bg = "#313244"
custom_catppuccin.command.b.bg = "#313244"
custom_catppuccin.command.b.bg = "#313244"

custom_catppuccin.normal.c.bg = ""
custom_catppuccin.inactive.a.bg = ""
custom_catppuccin.inactive.b.bg = ""
custom_catppuccin.inactive.c.bg = ""

vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
local git_blame = require("gitblame")

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = custom_catppuccin,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			"gitcommit",
		},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "", right = "" } },
		},
		lualine_b = { filename_custom },
		lualine_c = {
			"diagnostics",
			"diff",
		},
		lualine_x = {
			{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
			"filetype",
		},
		lualine_y = { "branch", "progress" },
		lualine_z = {
			{ "location", separator = { left = "", right = "" } },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	-- winbar = { lualine_a = { navic_winbar } },
	extensions = {},
})
