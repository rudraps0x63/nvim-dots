return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = function(_, _)
      -- vim.api.nvim_set_hl(0, 'SnacksPickerPreviewCursorLine', { link = 'CursorLine' })
      vim.api.nvim_set_hl(0, 'SnacksPickerListCursorLine', {
        bg = vim.api.nvim_get_hl(0, { name = 'Visual' }).bg, -- For darkvoid
        -- bg = '#1f161a',
        bold = true
      })

      return {
        explorer = {
          replace_netrw = true,
          auto_close = true,
          git_status = true,
        },
        picker = {
          enabled = true,
          -- Per source config
          sources = {
            explorer = {
              layout = { reverse = false },
              auto_close = true,
            },
            buffers = {
              finder = "buffers",
              format = "buffer",
              hidden = false,
              unloaded = true,
              current = true,
              sort_lastused = true,
              win = {
                input = { keys = { ['<C-d>'] = { "bufdelete", mode = { "n", "i" } } } }, -- Bufdelete keymap for input window
                list = { keys = { ['dd'] = "bufdelete" } }, -- Bufdelete keymap for list window
              },
            },
            diagnostics_buffer = {
              win = {
                list = {
                  wo = { wrap = true },
                }
              }
            },
          },
          formatters = {
            file = { filename_first = true, git_status_hl = true } -- use the git status highlight group for the filename
          },
          matcher = {
            fuzzy = true, -- use fuzzy matching
            smartcase = true, -- use smartcase
            -- ignorecase = true, -- use ignorecase
            sort_empty = false, -- sort results when the search string is empty
            filename_bonus = true, -- give bonus for matching file names (last part of the path)
            file_pos = true, -- support patterns like `file:line:col` and `file:line`
            -- the bonusses below, possibly require string concatenation and path normalization,
            -- so this can have a performance impact for large lists and increase memory usage
            cwd_bonus = false, -- give bonus for matching files in the cwd
            frecency = true, -- frecency bonus
            history_bonus = true, -- give more weight to chronological order
          }, win = {
            input = {
              keys = {
                ['<C-p>'] = { "toggle_preview", mode = { "i", "n" } },
                ['<C-q>'] = { "qflist", mode = { "i", "n" } },
              }
            },
          },
          -- Telescope-like layout
          layout = {
            reverse = true,
            layout = {
              box = "horizontal",
              backdrop = false,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
              },
              {
                win = "preview",
                title = "{preview:Preview}",
                width = 0.55,
                border = "rounded",
                title_pos = "center",
              }
            }
          }
        },
      }
    end
  }
}

