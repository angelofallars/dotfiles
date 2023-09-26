local M = {}

M.map = function(mode, shortcut, command, opts)
	vim.keymap.set(mode, shortcut, command, opts)
end

M.nmap = function(shortcut, command, opts)
	M.map("n", shortcut, command, opts)
end

M.imap = function(shortcut, command, opts)
	M.map("i", shortcut, command, opts)
end

M.vmap = function(shortcut, command, opts)
	M.map("v", shortcut, command, opts)
end

M.tmap = function(shortcut, command, opts)
	M.map("t", shortcut, command, opts)
end

M.create_command = function(name, command)
	vim.api.nvim_create_user_command(name, command, { nargs = "*" })
end

return M
