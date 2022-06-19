M = {}

M.init = function()
  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.opt.laststatus = 0
  vim.opt.cmdheight = 0

  require("telescope.builtin").git_files()

  vim.cmd([[
  autocmd WinLeave * set laststatus=3 cmdheight=1
  ]])
end

return M
