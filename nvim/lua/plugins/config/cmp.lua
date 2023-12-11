local cmp = require("cmp")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	window = {
		performance = {
			debounce = 500,
			throttle = 550,
			fetching_timeout = 80,
		},
		completion = {
			border = { "", "", "", "", "", "", "", "" },
			winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,FloatTitle:CmpBorderTitle,CursorLine:CmpSelect",
			side_padding = 1,
			keyword_length = 3,
		},
		documentation = {
			border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
			winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder,FloatTitle:CmpDocBorderTitle,CursorLine:CmpDocSelect",
		},
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-f>"] = cmp.mapping.scroll_docs(10),
		["<C-b>"] = cmp.mapping.scroll_docs(-10),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			end
		end, { "i", "s" }),

		["<C-p>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "path" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
	}),
	experimental = {
		ghost_text = true,
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use buffer source for `?`
cmp.setup.cmdline("?", {
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

local lspkind = require("lspkind")
cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations

			preset = "codicons",
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
})
