local M = {}

M.map = function(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command)
end

M.nmap = function(shortcut, command)
  M.map('n', shortcut, command)
end

M.imap = function(shortcut, command)
  M.map('i', shortcut, command)
end

M.vmap = function(shortcut, command)
  M.map('v', shortcut, command)
end

M.tmap = function(shortcut, command)
  M.map('t', shortcut, command)
end

M.create_command = function(name, command)
  vim.api.nvim_create_user_command(name, command, {nargs = '*'})
end

return M
