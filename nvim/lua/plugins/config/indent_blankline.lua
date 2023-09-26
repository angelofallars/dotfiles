-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.termguicolors = true

require("indent_blankline").setup({
	use_treesitter = true,
	char = "▏",
	filetype_exclude = {
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
	buftype_exclude = { "terminal" },
	space_char_blankline = " ",
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
})
