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

-- vim.cmd('colorscheme zenburn')
-- vim.g.zenburn_high_Contrast = 1
-- vim.g.zenburn_disable_bold_CursorBars = 1
-- vim.cmd('hi IblScope ctermfg=248 guifg=#9fafaf')
-- vim.cmd('hi Normal ctermbg=none guibg=none')

-- Bootstrap Lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup external plugins in lua/plugins
require('lazy').setup({
  change_detection = {
    enabled = true,
    notify = false -- get a notification when changes are found
  },
  spec = {
    { import = 'plugins' },
    { import = 'plugins.lsp' }
  },
  ui = {
    border = require('util.util').PREFERRED_BORDER_STYLE
  }
})

-- All plugins loaded, keymaps available
require('keymaps').setup()

