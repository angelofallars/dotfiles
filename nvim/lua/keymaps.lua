local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command)
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

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

-- Close buffer
nmap("<C-q>", ":bd<cr>")

-- System clipboard Mappings
nmap("<leader>y", '"+y')
nmap("<leader>Y", '"+yg_')
nmap("<leader>p", '"+p')
nmap("<leader>P", '"+P')
vmap("<leader>y", '"+y')

local readline = require 'readline'
vim.keymap.set('!', '<M-f>', readline.forward_word)
vim.keymap.set('!', '<M-b>', readline.backward_word)
vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
vim.keymap.set('!', '<C-e>', readline.end_of_line)
vim.keymap.set('!', '<M-d>', readline.kill_word)
vim.keymap.set('!', '<C-w>', readline.backward_kill_word)
vim.keymap.set('!', '<C-k>', readline.kill_line)
vim.keymap.set('!', '<C-u>', readline.backward_kill_line)

vim.keymap.set('!', '<C-f>', '<Right>')
vim.keymap.set('!', '<C-b>', '<Left>')
vim.keymap.set('!', '<C-n>', '<Down>')  -- next-line
vim.keymap.set('!', '<C-p>', '<Up>')    -- previous-line

vim.keymap.set('!', '<C-d>', '<Delete>')  -- delete-char
vim.keymap.set('!', '<C-h>', '<BS>')      -- backward-delete-char

nmap("<leader>J", '<cmd>Git<cr>')
nmap("<leader>jj", '<cmd>Git<cr>')

nmap("<leader>ja", '<cmd>Git add %<cr>')
nmap("<leader>jm", '<cmd>Git commit<cr>')
nmap("<leader>js", '<cmd>Git status<cr>')
nmap("<leader>jl", '<cmd>Git log<cr>')
nmap("<leader>jd", '<cmd>Git diff %<cr>')
