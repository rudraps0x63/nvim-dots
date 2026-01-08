local Util = require('util.util')

return {
  {
    'saghen/blink.cmp', version = '0.11.0',
    dependencies = 'rafamadriz/friendly-snippets',
    opts = {
      keymap = {
        preset = 'none',
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<C-Space>'] = { 'hide', 'fallback' },
        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
      },
      completion = {
        menu = {
          auto_show = true,
          draw = { -- nvim-cmp style menu
            columns = { { 'label', 'label_description', gap = 1 }, { 'kind' } },
          },
          border = Util.PREFERRED_BORDER_STYLE
        },
        documentation = { window = { border = Util.PREFERRED_BORDER_STYLE } },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        cmdline = { },
        providers = {
          -- cmdline = {
          --   enabled = false,
          --   min_keyword_length = function(ctx)
          --     -- when typing a command, only show when the keyword is 3 characters or longer
          --     if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then
          --       return 3
          --     end
          --
          --     return 0
          --   end,
          --   -- keymap = { preset = 'inherit' },
          -- } -- Autocomplete for vim commands
        },
      },
      signature = {
        enabled = true,
        window = { border = Util.PREFERRED_BORDER_STYLE }
      },
    },
  },
}

