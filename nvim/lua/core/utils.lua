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

return M
