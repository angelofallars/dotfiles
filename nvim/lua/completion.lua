local cmp = require'cmp'

cmp.setup({
  window = {
    completion = {
      border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃", },
      winhighlight = 'Normal:Normal,FloatBorder:green,CursorLine:Visual,Search:None', 
    },
    documentation = {
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│", },
      winhighlight = 'Normal:Normal,FloatBorder:white,CursorLine:Visual,Search:None', 
    },
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-f>'] = cmp.mapping.scroll_docs(10),
    ['<C-b>'] = cmp.mapping.scroll_docs(-10),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-j>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
      { name = 'buffer' },
      { name = "path" },
      { name = 'nvim_lsp_signature_help' }
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use buffer source for `?`
cmp.setup.cmdline('?', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
})

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        vsnip = "[VSnip]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      }),

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
}

