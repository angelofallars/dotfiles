local M = {}

M.start = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    local packer_bootstrap = fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
  end
end

M.options = {
   auto_clean = true,
   compile_on_sync = true,
   git = { clone_timeout = 600 },
   display = {
      open_fn = function()
         return require("packer.util").float { border = "single" }
      end,
   },
}

M.run = function(plugin_use)
   local present, packer = pcall(require, "packer")

   if not present then
      return
   end

   packer.init(M.options)

   packer.startup(plugin_use)
end

return M
