local rt = require("rust-tools")
rt.setup({
	server = {
		on_attach = function(client, bufnr)
			require("plugins.config.lsp").on_attach(client, bufnr)
			vim.keymap.del("n", "K", { buffer = bufnr })
			vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { noremap = true, buffer = bufnr })
		end,
	},
})
