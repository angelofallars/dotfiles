local function create_command(name, command)
  vim.api.nvim_create_user_command(name, command, {nargs = '*'})
end

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

create_command("J",    "Git <args>")

create_command("Ja",   "Git add <args>")
create_command("Jaa",  "Git add . <args>")
create_command("Jab",  "Git add % <args>")
create_command("Jrm",  "Git rm <args>")
create_command("Jm",   "Git commit <args>")
create_command("Jma",  "Git commit --all <args>")

create_command("Jps",  "Git push <args>")
create_command("Jpl",  "Git pull <args>")
create_command("Jf",   "Git fetch <args>")

create_command("Jrs",   "Git restore args>")
create_command("Jrss",  "Git restore --staged args>")

create_command("Jpsu", "Git push -u origin main <args>")

create_command("Jr",   "Git remote <args>")
create_command("Jrv",  "Git remote --verbose <args>")
create_command("Jrao", "Git remote add origin <args>")
create_command("Jrso", "Git remote set-url origin <args>")

create_command("Js",   "Git status <args>")
create_command("Jl",   "Git log <args>")
create_command("Jd",   "Git diff <args>")
create_command("Jds",  "Git diff --staged <args>")
create_command("Jd1",  "Git diff diff HEAD~1 <args>")
create_command("Jd2",  "Git diff diff HEAD~2 <args>")
create_command("Jd3",  "Git diff diff HEAD~3 <args>")

create_command("Jb",   "Git branch <args>")
create_command("Jc",  "Git checkout <args>")

