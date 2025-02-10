return {
  {
    -- NvimTree: File system explorer (:h NvimTree)
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('nvim-tree').setup({
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

      vim.cmd('highlight IblIndent guifg=#1e1e24')
      vim.cmd('highlight IblScope gui=none guifg=#8a8fa8')
    end
  },
  {
    -- Telescope, a fuzzy finder for files/grepping (:h telescope)
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
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
    keys = {
      {
        '<leader>?', function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer local keymaps (which-key)',
      },
    },
    opts = {
      loop = true
    }
  },
}

