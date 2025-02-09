return {
  {
    'saghen/blink.cmp', version = '0.11.0',
    dependencies = 'rafamadriz/friendly-snippets',
    opts = {
      keymap = { preset = 'default' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        cmdline = {} -- Don't autocomplete for vim commands
      },
      completion = {
        menu = { border = 'rounded' },
        documentation = {
          window = { border = 'single' }
        },
      },
      signature = {
        window = { border = 'single' }
      },
    },
  },
}

