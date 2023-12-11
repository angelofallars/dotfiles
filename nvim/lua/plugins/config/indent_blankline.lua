vim.opt.list = true
vim.opt.listchars:append("space: ")
vim.opt.listchars:append("tab:\\x20\\x20")
vim.opt.listchars:append("eol:↴")

require("ibl").setup({
	scope = {
		enabled = true,
		show_start = false,
		show_end = false,
		priority = 512,
	},
	indent = {
		tab_char = "▏",
		char = "▏",
	},
	whitespace = {
		remove_blankline_trail = true,
	},
	exclude = {
		buftypes = {
			"help",
			"terminal",
			"packer",
			"lspinfo",
			"TelescopePrompt",
			"TelescopeResults",
			"lsp-installer",
			"NvimTree",
			"gitcommit",
		},
	},
})

-- local hooks = require("ibl.hooks")
-- hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
-- hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
