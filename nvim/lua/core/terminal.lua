local terminal_exists = false

M.new = function()
  vim.cmd([[below 12split]])
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_option(buf, "filetype", "terminal")
  vim.api.nvim_buf_set_option(buf, "buflisted", false)
  vim.api.nvim_win_set_buf(win, buf)

  local job_id = vim.fn.termopen(vim.o.shell)
  vim.cmd("startinsert")

  terminal_exists = true
end

