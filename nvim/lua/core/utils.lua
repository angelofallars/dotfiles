local M = {}

function M.map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command)
end

function M.nmap(shortcut, command)
  M.map('n', shortcut, command)
end

function M.imap(shortcut, command)
  M.map('i', shortcut, command)
end

function M.vmap(shortcut, command)
  M.map('v', shortcut, command)
end

function M.create_command(name, command)
  vim.api.nvim_create_user_command(name, command, {nargs = '*'})
end

return M
