local border = {
	{ "r", "FloatBorder" },
	{ " ", "FloatBorder" },
	{ " ", "FloatBorder" },
	{ " ", "FloatBorder" },
	{ " ", "FloatBorder" },
	{ " ", "FloatBorder" },
	{ " ", "FloatBorder" },
	{ " ", "FloatBorder" },
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
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- require("lsp-format").setup({
-- 	python = {
-- 		exclude = {
-- 			"pylsp",
-- 		},
-- 	},
-- 	lua = {
-- 		exclude = { "lua_ls" },
-- 	},
-- 	rust = {
-- 		exclude = { "rust_analyzer" },
-- 	},
-- })

local navic = require("nvim-navic")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- require("lsp-format").on_attach(client, bufnr)

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<space>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>n", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>m", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, { buffer = bufnr })

	vim.diagnostic.config({
		virtual_text = {
			prefix = "", -- Could be '●', '▎', 'x'
		},
		severity_sort = true,
		float = {
			border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
		},
	})

	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
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

	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lspconfig = require("lspconfig")

local servers = {
	"bashls",
	"clangd",
	"html",
	"htmx",
	"cssls",
	"jsonls",
	"tsserver",
	"eslint",
	"sqlls",
	"vimls",
	"rust_analyzer",
	"gopls",
	"golangci_lint_ls",
	"templ",
	"dockerls",
	"racket_langserver",
	-- "zls",
	"tailwindcss",
	"astro",
	"vuels",
}

for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		flags = {
			-- This will be the default in neovim 0.7+
			debounce_text_changes = 150,
		},
		capabilities = capabilities,
	})
end

-- Format current buffer using LSP.
vim.api.nvim_create_autocmd({
	-- 'BufWritePre' event triggers just before a buffer is written to file.
	"BufWritePre",
}, {
	pattern = { "*.templ" },
	callback = function()
		-- Format the current buffer using Neovim's built-in LSP (Language Server Protocol).
		vim.lsp.buf.format()
	end,
})

require("lspconfig").tailwindcss.setup({
	filetypes = {
		"templ",
		-- include any other filetypes where you need tailwindcss
	},
	init_options = {
		userLanguages = {
			templ = "html",
		},
	},
})

require("lspconfig").htmx.setup({
	filetypes = {
		"templ",
		-- include any other filetypes where you need tailwindcss
	},
})

require("lspconfig").gopls.setup({
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
})

local lspconfig_util = require("lspconfig").util

local function find_ancestor(fileNames)
	return function(startpath)
		return lspconfig_util.search_ancestors(startpath, function(path)
			for _, fileName in ipairs(fileNames) do
				if lspconfig_util.path.is_file(lspconfig_util.path.join(path, fileName)) then
					return path
				end
			end
		end)
	end
end

require("lspconfig").pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pyright = {
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

local ruff_on_attach = function(client, bufnr)
	-- Disable hover in favor of Pyright
	client.server_capabilities.hoverProvider = false
	on_attach(client, bufnr)
end

require("lspconfig").ruff_lsp.setup({
	on_attach = ruff_on_attach,
	capabilities = capabilities,
	init_options = {},
	root_dir = find_ancestor({ "ruff.toml", "pyproject.toml" }),
	-- root_dir = require("lspconfig").util.find_git_ancestor,
})

lspconfig.lua_ls.setup({
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
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
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
	on_attach = on_attach,
	flags = {
		-- This will be the default in neovim 0.7+
		debounce_text_changes = 150,
	},
	capabilities = capabilities,
})

local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = on_attach,
	},
})

lspconfig.ltex.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"bib",
		"markdown",
		"org",
		"plaintex",
		"rst",
		"rnoweb",
		"tex",
	},
})

local function lspSymbol(name, icon)
	vim.fn.sign_define("DiagnosticSign" .. name, { text = icon, texthl = "Diagnostic" .. name })
end

lspSymbol("Error", "󰅚")
lspSymbol("Hint", "󰌶")
lspSymbol("Info", "")
lspSymbol("Warn", "󰀪")
lspSymbol("Warn", "󰀪")
