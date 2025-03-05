local Util = require('util.util')

return {
  {
    -- NvimTree: File system explorer (:h NvimTree)
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
      view = { number = true },
      renderer = {
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          }
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      }
    })
    end,
  },
  {
    -- Indent lines (:h ibl.config)
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    lazy = false,
    config = function()
      require('ibl').setup({
        scope = {
          enabled = true,
          show_start = false,
          show_end = false -- underlines are shown (set true) by default
        },
      })
    end
  },
  {
    -- Telescope, a fuzzy finder for files/grepping (:h telescope)
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = {
      {
        'nvim-lua/plenary.nvim'
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
      }
    },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              height = { padding = 0.1 },
              width = { padding = 0.08 },
              preview_width = 0.6
            },
          },
          path_display = function(_, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s | %s", tail, path)
          end,
          mappings = {
            i = {
              ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
              ['<C-j>'] = require('telescope.actions').move_selection_next,
              ['<C-k>'] = require('telescope.actions').move_selection_previous
            },
            n = {
              ['<C-p>'] = require('telescope.actions.layout').toggle_preview
            }
          }
        },
        pickers = {
          buffers = {
            sort_mru = true,
            show_all_buffers = true
          },
        },
      })
      require('telescope').load_extension('fzf')
    end
  },
  {
    -- Tree-sitter for parsing the language; helps with highlighting and Telescope
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'javascript', 'html', 'rust' },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = { loop = true },
    keys = {
      {
        '<leader>?', function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer local keymaps (which-key)',
      },
    }
  },
  {
    'rlane/pounce.nvim',
    config = function()
      local pounce = require('pounce')

      Util.set_mapping('n', 's', function() pounce.pounce({}) end, {
        desc = 'Fuzzy search and pounce'
      })
      Util.set_mapping('n', 'S', function() pounce.pounce({ do_repeat = true }) end, {
        desc = 'Fuzzy search and pounce repeat'
      })
    end
  },
  -- {
  --   'SidOfc/carbon.nvim',
  --   config = function()
  --     require('carbon').setup()
  --   end
  -- }
}

