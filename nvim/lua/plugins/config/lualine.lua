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

custom_catppuccin.normal.c.bg = "NONE"
custom_catppuccin.inactive.a.bg = "NONE"
custom_catppuccin.inactive.b.bg = "NONE"
custom_catppuccin.inactive.c.bg = "NONE"

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = custom_catppuccin,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		component_separators = "󰇙",
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
		lualine_x = { "filetype" },
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
