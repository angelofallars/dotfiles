vim.cmd([[

let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      '!': "<!DOCTYPE html>\n"
\              ."<html lang=\"en\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

" Indent width on web dev languages
autocmd FileType html setlocal shiftwidth=2 tabstop=2 textwidth=120
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType sass setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType less setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType jsx setlocal shiftwidth=2 tabstop=2
autocmd FileType tsx setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType angular setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2

autocmd BufNewFile,BufRead *.njk set filetype=html
autocmd BufNewFile,BufRead *waybar/config set syntax=json
autocmd BufNewFile,BufRead *.rasi set syntax=css
autocmd BufNewFile,BufRead *dunstrc set filetype=ini

" Indent width for C (the Unix Way)
autocmd FileType c setlocal shiftwidth=8 tabstop=8

autocmd FileType go setlocal noexpandtab

autocmd FileType scheme set shiftwidth=2 tabstop=2

autocmd BufEnter * silent! lcd %:p:h

]])

vim.opt.autochdir=true
vim.opt.expandtab=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.swapfile=false
vim.opt.textwidth=0
vim.opt.ai=true
vim.opt.colorcolumn="0"
vim.opt.updatetime=500
vim.opt.wrap=true

vim.opt.ignorecase=true
vim.opt.smartcase=true

vim.opt.undofile = true
vim.opt.completeopt = 'menuone,noselect'

-- Blinking cursor
vim.opt.guicursor = vim.opt.guicursor + "n-v-c-i:blinkon5"

vim.opt.compatible=false
vim.cmd([[filetype plugin on]])

vim.cmd([[syntax enable]])                  -- Enables syntax highlighing
vim.opt.smartindent=true                    -- Makes indenting smart
vim.opt.autoindent=true                     -- Good auto indent
vim.opt.cindent=true                        -- C indentation
vim.opt.number=true                         -- Line number at current line
vim.opt.relativenumber=true                 -- Relative line number
vim.opt.updatetime=250                      -- Faster completion

vim.g.AutoPairsShortcutBackInsert = ''
vim.g.rustfmt_autosave = 1

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.presence_blacklist = {".config", "sofsafe"}

vim.g.goyo_width = 150

require('telescope').load_extension('fzf')

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hu', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hr', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

