local dap, dapui = require("dap"), require("dapui")

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-go').setup()

require("dapui").setup({
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      { id = "stacks", size = 0.25 },
      {
        id = "scopes",
        size = 0.30, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.20 },
      { id = "watches", size = 00.25 },
    },
    size = 50,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl", "console" },
    size = 12,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
})
require("nvim-dap-virtual-text").setup()

vim.keymap.set("n", "<M-f>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<M-j>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<M-k>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<M-l>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<M-v>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<M-b>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<M-n>", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<M-d>", ":lua require'dap'.repl.open()<CR>")

vim.keymap.set("n", "<M-t>", ":lua require'dapui'.toggle()<CR>")
vim.keymap.set("n", "<M-y>", ":lua require'dapui'.toggle('tray')<CR>")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

