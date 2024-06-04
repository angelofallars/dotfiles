require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },

		-- Conform will run multiple formatters sequentially
		-- python = { "ruff_isort", "ruff_format" },

		go = { "gofumpt" },

		templ = { "templ" },

		gleam = { "gleam" },

		-- markdown = { "markdownlint-cli2", "cbfmt" },

		json = { "fixjson" },
		json5 = { "fixjson" },
		jsonc = { "fixjson" },

		rust = { "rustfmt" },
		zig = { "zigfmt" },

		-- Use a sub-list to run only the first available formatter
		astro = { "prettier" },
		html = { "biome" },
		css = { "biome" },
		scss = { "biome" },
		-- javascript = { "biome" },
		typescript = { "biome" },
		javascriptreact = { "biome" },
		typescriptreact = { "biome" },

		rescript = { "rescript-format" },

		["_"] = { "trim_whitespace", "trim_newlines" },
	},
	format_after_save = {
		-- These options will be passed to conform.format()
		lsp_fallback = false,
	},

	formatters = {
		["markdownlint-cli2"] = {
			prepend_args = {
				"--config",
				vim.env.HOME .. "/.config/nvim/lua/plugins/config/formatter/.markdownlint-cli2.jsonc",
			},
		},
		cbfmt = {
			prepend_args = {
				"--config",
				vim.env.HOME .. "/.config/nvim/lua/plugins/config/formatter/.cbfmt.toml",
			},
		},

		ruff_isort = {
			-- This can be a string or a function that returns a string
			command = "ruff",

			-- OPTIONAL - all fields below this are optional
			-- A list of strings, or a function that returns a list of strings
			-- Return a single string instead to run the command in a shell
			args = { "check", "-", "--fix", "--select", "I001" },

			-- Send file contents to stdin, read new contents from stdout (default true)
			-- When false, will create a temp file (will appear in "$FILENAME" args). The temp
			-- file is assumed to be modified in-place by the format command.
			stdin = true,

			-- A function that calculates the directory to run the command in
			cwd = require("conform.util").root_file({ "pyproject.toml", "ruff.toml" }),

			-- When cwd is not found, don't run the formatter (default false)
			require_cwd = false,

			-- Exit codes that indicate success (default {0})
			exit_codes = { 0, 1 },
		},

		-- rescriptfmt = {
		-- 	command = "bun",
		--
		-- 	args = { "x", "rescript", "format", "-stdin", ".res" },
		--
		-- 	-- A function that calculates the directory to run the command in
		-- 	cwd = require("conform.util").root_file({ "rescript.json" }),
		--
		-- 	-- When cwd is not found, don't run the formatter (default false)
		-- 	require_cwd = false,
		-- },
	},
})
