vim.cmd([[
command -nargs=* J    Git <args>

command -nargs=* Ja   Git add <args>
command -nargs=* Jaa  Git add . <args>
command -nargs=* Jrm  Git rm <args>
command -nargs=* Jm   Git commit <args>
command -nargs=* Jma  Git commit --all <args>

command -nargs=* Jps  Git push <args>
command -nargs=* Jpl  Git pull <args>
command -nargs=* Jf   Git fetch <args>

command -nargs=* Jrs   Git restore args>
command -nargs=* Jrss  Git restore --staged args>

command -nargs=* Jpsu Git push -u origin main <args>

command -nargs=* Jr   Git remote <args>
command -nargs=* Jrv  Git remote --verbose <args>
command -nargs=* Jrao Git remote add origin <args>
command -nargs=* Jrso Git remote set-url origin <args>

command -nargs=* Js   Git status <args>
command -nargs=* Jl   Git log <args>
command -nargs=* Jd   Git diff <args>
command -nargs=* Jds  Git diff --staged <args>
command -nargs=* Jd1  Git diff diff HEAD~1 <args>
command -nargs=* Jd2  Git diff diff HEAD~2 <args>
command -nargs=* Jd3  Git diff diff HEAD~3 <args>

command -nargs=* Jb   Git branch <args>
command -nargs=* Jc  Git checkout <args>
]])

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
nmap("<leader>y ", "+")
nmap("<leader>Y ", "+yg_")
nmap("<leader>p ", "+")
nmap("<leader>P ", "+")
vmap("<leader>y ", "+")

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
