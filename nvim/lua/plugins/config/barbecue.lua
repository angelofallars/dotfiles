require("barbecue").setup({
	attach_navic = true, -- prevent barbecue from automatically attaching nvim-navic
	theme = "catppuccin", -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
	exclude_filetypes = { "netrw", "toggleterm", "gitcommit", "COMMIT_EDITMSG" },
})
