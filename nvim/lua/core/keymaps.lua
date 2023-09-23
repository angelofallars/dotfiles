local utils = require('core.utils')
local map = utils.map
local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap
local tmap = utils.tmap

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

nmap("<leader>r", '<Plug>RestNvim')

-- Harpoon baby!
nmap("<leader>t", ":lua require('harpoon.mark').add_file()<CR>")
nmap("<C-g>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
nmap("<leader>tc", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>")

nmap("<C-t>", ":lua require('harpoon.ui').nav_next()<CR>")
nmap("<C-n>", ":lua require('harpoon.ui').nav_prev()<CR>")
nmap("<C-m>", ":lua require('harpoon.ui').nav_file(3)<CR>")
nmap("<C-k>", ":lua require('harpoon.ui').nav_file(4)<CR>")

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

-- local function create_new_terminal()
--   vim.cmd([[below 12split]])
--   vim.wo.relativenumber = false
--   vim.wo.number = false
--
--   local win = vim.api.nvim_get_current_win()
--   local buf = vim.api.nvim_create_buf(false, true)
--
--   vim.api.nvim_buf_set_option(buf, "filetype", "terminal")
--   vim.api.nvim_buf_set_option(buf, "buflisted", false)
--   vim.api.nvim_win_set_buf(win, buf)
--
--   local job_id = vim.fn.termopen(vim.o.shell)
--   vim.cmd("startinsert")
-- end
--
-- nmap('<M-i>', create_new_terminal)
--

-- Exit terminal and go to last window
-- map('t', '<C-w>', '<C-\\><C-n><C-w>p')
--
-- nmap('<M-r>',
--   function()
--     require("nvterm.terminal").toggle "horizontal"
--   end
-- )
--
-- tmap('<M-r>',
--   function()
--     require("nvterm.terminal").toggle "horizontal"
--   end
-- )
--
-- nmap('<M-u>',
--   function()
--     require("nvterm.terminal").toggle "vertical"
--   end
-- )
--
-- tmap('<M-u>',
--   function()
--     require("nvterm.terminal").toggle "vertical"
--   end
-- )
--
-- nmap('<M-i>',
--   function()
--     require("nvterm.terminal").toggle "float"
--   end
-- )
--
-- tmap('<M-i>',
--   function()
--     require("nvterm.terminal").toggle "float"
--   end
-- )

nmap("<leader>J", '<cmd>Git<cr>')
nmap("<leader>jj", '<cmd>Git<cr>')

nmap("<leader>ja", '<cmd>Git add %<cr>')
nmap("<leader>jm", '<cmd>Git commit<cr>')
nmap("<leader>js", '<cmd>Git status<cr>')
nmap("<leader>jl", '<cmd>Git log<cr>')
nmap("<leader>jd", '<cmd>Git diff %<cr>')

nmap("<C-e>", ":NvimTreeToggle<cr>")
