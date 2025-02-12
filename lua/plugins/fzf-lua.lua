return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      local fzf_lua = require('fzf-lua')

      fzf_lua.setup({
        { 'telescope' },
        defaults = { -- "Global" picker defaults, applied when a picker is active
          actions = {
            ['C-q'] = require('fzf-lua').actions.set_qflsit,
          },
          prompt = '> ',
          cwd_prompt = false,
          formatter = { 'path.filename_first', 2 },
          winopts = {
            preview = {
              vertical = "up:45%",
              horizontal = "right:61%",
            }
          },
        },
        keymap = {
          builtin = {
            ['<Leader>ff'] = fzf_lua.files
          }
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

