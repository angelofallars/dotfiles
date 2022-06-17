local utils = require('core.utils')
local map = utils.map
local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap

vim.g.mapleader = " "

-- Search for <files> in the git repository
nmap("<C-p>", ":lua require'telescope.builtin'.git_files{show_untracked = true}<cr>")

vim.api.nvim_create_autocmd('BufRead',
  { pattern = '*/.config/*',
    command = 'nnoremap <C-p> :lua require"telescope.builtin".git_files{show_untracked = false}<cr>' })

nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>")
nmap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

nmap("<leader>l", "<cmd>!librewolf %<cr>")

-- Harpoon baby!
nmap("<leader>a", ":lua require('harpoon.mark').add_file()<CR>")
nmap("<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
nmap("<leader>tc", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>")

nmap("<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>")
nmap("<C-j>", ":lua require('harpoon.ui').nav_file(2)<CR>")
nmap("<C-k>", ":lua require('harpoon.ui').nav_file(3)<CR>")
nmap("<C-l>", ":lua require('harpoon.ui').nav_file(4)<CR>")

nmap("<C-c>", ":noh<CR>:<Esc>")

nmap("<C-w>u", "<C-w>q")

-- System clipboard Mappings
nmap("<leader>y", '"+y')
nmap("<leader>Y", '"+yg_')
nmap("<leader>p", '"+p')
nmap("<leader>P", '"+P')
vmap("<leader>y", '"+y')

local readline = require 'readline'

map('!', '<M-f>', readline.forward_word)
map('!', '<M-b>', readline.backward_word)
map('!', '<C-a>', readline.beginning_of_line)
map('!', '<C-e>', readline.end_of_line)
map('!', '<M-d>', readline.kill_word)
map('!', '<C-w>', readline.backward_kill_word)
map('!', '<C-k>', readline.kill_line)
map('!', '<C-u>', readline.backward_kill_line)

map('!', '<C-f>', '<Right>')
map('!', '<C-b>', '<Left>')
map('!', '<C-n>', '<Down>')  -- next-line
map('!', '<C-p>', '<Up>')    -- previous-line

map('!', '<C-d>', '<Delete>')  -- delete-char
map('!', '<C-h>', '<BS>')      -- backward-delete-char

nmap("<leader>J", '<cmd>Git<cr>')
nmap("<leader>jj", '<cmd>Git<cr>')

nmap("<leader>ja", '<cmd>Git add %<cr>')
nmap("<leader>jm", '<cmd>Git commit<cr>')
nmap("<leader>js", '<cmd>Git status<cr>')
nmap("<leader>jl", '<cmd>Git log<cr>')
nmap("<leader>jd", '<cmd>Git diff %<cr>')

nmap("<C-n>", ":NvimTreeToggle<cr>")
