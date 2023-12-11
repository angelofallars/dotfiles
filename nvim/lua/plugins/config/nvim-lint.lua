local lint = require("lint")

local markdownlint = lint.linters.markdownlint
markdownlint.args = {
	"--config",
	vim.env.HOME .. "/.config/nvim/lua/plugins/config/formatter/.markdownlint-cli2.jsonc",
}

lint.linters_by_ft = {
	markdown = { "markdownlint" },
	zsh = { "zsh" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("lint", { clear = true }),
	callback = function()
		lint.try_lint()
	end,
})
