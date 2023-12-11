local utils = require("core.utils")
local map = utils.map
local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap
local tmap = utils.tmap

vim.g.mapleader = " "

-- Search for <files> in the git repository
nmap("<C-p>", ":lua require'telescope.builtin'.git_files{show_untracked = true}<cr>")

nmap("<C-f>", ":lua require'telescope.builtin'.live_grep()<cr>")

vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*/.config/*",
	command = 'nnoremap <C-p> :lua require"telescope.builtin".git_files{show_untracked = false}<cr>',
})

nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>")
nmap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

nmap("<leader>l", "<cmd>!librewolf %<cr>")

nmap("<C-c>", ":noh<CR>:<Esc>")

nmap("<C-w>u", "<C-w>q")

-- System clipboard Mappings
nmap("<leader>y", '"+y')
nmap("<leader>Y", '"+yg_')
nmap("<leader>p", '"+p')
nmap("<leader>P", '"+P')
vmap("<leader>y", '"+y')

nmap("<leader>J", "<cmd>Git<cr>")
nmap("<leader>jj", "<cmd>Git<cr>")

nmap("<leader>ja", "<cmd>Git add %<cr>")
nmap("<leader>jm", "<cmd>Git commit<cr>")
nmap("<leader>js", "<cmd>Git status<cr>")
nmap("<leader>jl", "<cmd>Git log<cr>")
nmap("<leader>jd", "<cmd>Git diff %<cr>")

local function toggle_git_dir()
	local is_inside_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree") == "true\n"

	local path
	if is_inside_git_repo then
		local git_root_dir = vim.fn.system("git rev-parse --show-toplevel")
		path = git_root_dir
	else
		path = "."
	end

	require("nvim-tree.api").tree.toggle()
end

vim.keymap.set("n", "<C-e>", toggle_git_dir)
