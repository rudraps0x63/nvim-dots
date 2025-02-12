local Util = require('util.util')

return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require('fzf-lua').setup({
        { 'telescope' }, -- Base profile
        defaults = { -- "Global" picker defaults, applied when a picker is active
          actions = {
            ['<C-q>'] = require('fzf-lua').actions.set_qflsit,
          },
          prompt = '> ',
          cwd_prompt = false,
          formatter = { 'path.filename_first', 2 },
          winopts = {
            preview = {
              vertical = "up:45%",
              horizontal = "right:61%",
            },
            on_create = function()
              Util.set_mapping('t', '<C-p>', require('fzf-lua').win.toggle_preview, {
                silent = true, buffer = true,
                desc = 'Toggle fzf-lua preview'
              })
            end
          },
        },
        files = {
          cmd = "rg --files",
        },
        buffers = {
          ignore_current_buffer = false
        }
      })
    end
  }
}

