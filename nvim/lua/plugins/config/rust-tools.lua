require("rust-tools").setup({
	server = {
		on_attach = require("plugins.config.lsp").on_attach,
	},
})
