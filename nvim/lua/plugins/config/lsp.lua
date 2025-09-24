local M = {}

local border = {
	{ "┏", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┓", "FloatBorder" },
	{ "┃", "FloatBorder" },
	{ "┛", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┗", "FloatBorder" },
	{ "┃", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename identifier" })
vim.keymap.set("n", "<space>n", vim.lsp.buf.code_action, { desc = "Rename identifier" })

local navic = require("nvim-navic")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
})

vim.lsp.inlay_hint.enable(vim.lsp.inlay_hint.is_enabled())

vim.diagnostic.config({
	virtual_text = {
		prefix = "", -- Could be '●', '▎', 'x'
		spacing = 0,
	},
	severity_sort = true,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)

-- Enable completion triggered by <c-x><c-o>
-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

local ts_opts = { fname_width = 20, trim_text = true, reuse_win = true }

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.keymap.set("n", "gd", function()
	require("telescope.builtin").lsp_definitions(ts_opts)
end)

vim.keymap.set("n", "gD", function()
	require("telescope.builtin").lsp_type_definitions(ts_opts)
end)

vim.keymap.set("n", "gr", function()
	require("telescope.builtin").lsp_references(ts_opts)
end)

vim.keymap.set("n", "gs", function()
	require("telescope.builtin").lsp_dynamic_workspace_symbols({
		fname_width = 15,
		symbol_width = 20,
		reuse_win = true,
	})
end)

vim.keymap.set("n", "gi", function()
	require("telescope.builtin").lsp_implementations(ts_opts)
end)

vim.keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
vim.keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
vim.keymap.set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

vim.keymap.set("i", "<C-k>", function()
	vim.lsp.buf.signature_help()
end)

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		-- Do not overwrite existing floating diagnostic
		for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
			if vim.api.nvim_win_get_config(winid).zindex then
				return
			end
		end

		local options = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, options)
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Document highlight",
	callback = function(a)
		local client = vim.lsp.get_client_by_id(a.data.client_id)
		if client == nil or not client.server_capabilities["documentHighlightProvider"] then
			return
		end

		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})

		vim.api.nvim_clear_autocmds({
			group = "lsp_document_highlight",
		})

		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			callback = vim.lsp.buf.clear_references,
		})
	end,
})

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local servers = {
	"astro",
	"bashls",
	"biome",
	"clangd",
	"cssls",
	"dockerls",
	"gleam",
	"jsonls",
	"templ",
	"racket_langserver",
	"rescriptls",
	"sqlls",
	"typos_lsp",
	"vimls",
	"vuels",
	"zls",
}

for _, lsp in pairs(servers) do
	vim.lsp.enable(lsp)
end

vim.lsp.config("omnisharp", {
	cmd = { "/usr/bin/OmniSharp" },
	handlers = {
		["textDocument/definition"] = function(...)
			return require("omnisharp_extended").handler(...)
		end,
	},
	keys = {
		{
			"gd",
			function()
				require("omnisharp_extended").telescope_lsp_definitions()
			end,
			desc = "Goto Definition",
		},
	},
	enable_roslyn_analyzers = true,
	organize_imports_on_format = true,
	enable_import_completion = true,
	capabilities = capabilities,
})

vim.lsp.config("biome", {
	filetypes = {
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"typescript",
		"typescript.tsx",
		"typescriptreact",
		"astro",
		"vue",
	},
})

vim.lsp.config("html", {
	capabilities = capabilities,
	filetypes = { "html", "templ" },
})

vim.lsp.config("tailwindcss", {
	filetypes = {
		"templ",
		"astro",
		"html",
		-- include any other filetypes where you need tailwindcss
	},
	init_options = {
		userLanguages = {
			templ = "html",
		},
	},
})

vim.lsp.config("htmx", {
	filetypes = {
		"templ",
		-- include any other filetypes where you need tailwindcss
	},
})

vim.lsp.config("basedpyright", {
	capabilities = capabilities,
	settings = {
		basedpyright = {
			disableLanguageServices = false,
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				diagnosticMode = "workspace",
				autoImportCompletions = true,
				typeCheckingMode = "normal",
			},
		},
	},
})

vim.lsp.config("ruff", {
	init_options = {
		settings = {
			args = {},
			organizeImports = true,
			fixAll = true,
		},
	},
})

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			gofumpt = true,
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				ignoredError = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
			semanticTokens = true,
		},
	},
})

vim.lsp.config("lua_ls", {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = true,
						library = {
							vim.env.VIMRUNTIME,
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						},
						userThirdParty = {
							vim.env.HOME .. ".local/share/nvim/lazy/*",
						},
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
	flags = {
		-- This will be the default in neovim 0.7+
		debounce_text_changes = 150,
	},
	capabilities = capabilities,
})

-- Workaround for truncating long TypeScript inlay hints.
-- TODO: Remove this if https://github.com/neovim/neovim/issues/27240 gets addressed.
local methods = vim.lsp.protocol.Methods
local inlay_hint_handler = vim.lsp.handlers[methods.textDocument_inlayHint]
local ellipsis = " …"
local max_inlay_length = 30
vim.lsp.handlers[methods.textDocument_inlayHint] = function(err, result, ctx, config)
	local client = vim.lsp.get_client_by_id(ctx.client_id)
	if client and client.name == "typescript-tools" then
		result = vim.iter(result)
			:map(function(hint)
				local label = hint.label ---@type string
				if label:len() >= max_inlay_length then
					label = label:sub(1, max_inlay_length - 1) .. ellipsis
				end
				hint.label = label
				return hint
			end)
			:totable()
	end

	inlay_hint_handler(err, result, ctx, config)
end

local function lspSymbol(name, icon)
	vim.fn.sign_define("DiagnosticSign" .. name, { text = icon, texthl = "Diagnostic" .. name })
end

lspSymbol("Error", "󰅚")
lspSymbol("Hint", "󰌶")
lspSymbol("Info", "")
lspSymbol("Warn", "󰀪")

return M
