local function improve_startup_time()
  require('impatient').enable_profile()
end

improve_startup_time()

require('core.options')
require('core.keymaps')
require('core.commands')

require('core.packer').start()
require('plugins')
