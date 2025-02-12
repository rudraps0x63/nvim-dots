local Util = require('util.util')

return {
  {
    'saghen/blink.cmp', version = '0.11.0',
    dependencies = 'rafamadriz/friendly-snippets',
    opts = {
      keymap = {
        preset = 'none',
        ['K'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['T'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        cmdline = {} -- Don't autocomplete for vim commands
      },
      completion = {
        menu = { border = Util.PREFERRED_BORDER_STYLE },
        documentation = {
          window = { border = Util.PREFERRED_BORDER_STYLE }
        },
      },
      signature = {
        window = { border = Util.PREFERRED_BORDER_STYLE }
      },
    },
  },
}

