return {
  "A7Lavinraj/fyler.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  branch = "stable",
  config = function()
    require('fyler').setup({
      win = {
        kind = "float",
      },
      views = {
        confirm = {
          win = {
            kind = "float",
          },
        },
        explorer = {
          confirm_simple = true,
          default_explorer = true,
          win = {
            border = "rounded",
            buf_opts = {
              buflisted = false,
              buftype = "acwrite",
              expandtab = true,
              filetype = "fyler",
              shiftwidth = 2,
              syntax = "fyler",
            },
            kind = "float",
            -- kind_presets = {
            --   split_left_most = {
            --     width = 0.12,
            --   },
            -- },
          },
        },
      },
    })
  end
}
