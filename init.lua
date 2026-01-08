--[[
    Consult Vim help (:h <cmd/option>) to check things like
    which option is global, window, or local etc.
--]]

--[[
    Pasting here so that I don't forget again:
        - vim.api.nvim_set_option_value('number', true, {})
                                                        ^ optional but mandatory table
--]]

-- On startup
require('common').setup()

-- Bootstrap Lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup external plugins in lua/plugins
require('lazy').setup({
  change_detection = {
    enabled = false,
    notify = false -- get a notification when changes are found
  },
  spec = {
    { import = 'plugins' },
    { import = 'colorschemes' },
  },
  -- ui = { border = require('util.util').PREFERRED_BORDER_STYLE }
})

-- Setup lsp
require('lsp').setup()
-- All plugins loaded, keymaps available
require('keymaps').setup()

