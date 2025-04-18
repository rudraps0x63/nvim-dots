local Util = require('util.util')

return {
  -- {
  --   -- NvimTree: File system explorer (:h NvimTree)
  --   'nvim-tree/nvim-tree.lua',
  --   version = '*',
  --   lazy = false,
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     require('nvim-tree').setup({
  --     view = { number = true },
  --     renderer = {
  --       indent_markers = {
  --         enable = true,
  --         inline_arrows = true,
  --         icons = {
  --           corner = '└',
  --           edge = '│',
  --           item = '│',
  --           bottom = '─',
  --           none = ' ', }
  --       },
  --     },
  --     diagnostics = {
  --       enable = true,
  --       show_on_dirs = true,
  --     }
  --   })
  --   end,
  -- },
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
            local tail = require('telescope.utils').path_tail(path)
            return string.format('%s | %s', tail, path)
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
    lazy = false,
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
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd('BufEnter', { -- Hack, with this only Neotree window opens
        -- make a group to be able to delete it later
        group = vim.api.nvim_create_augroup('neo-tree-init', { clear = true }),
        callback = function()
          local f = vim.fn.expand('%:p')

          if vim.fn.isdirectory(f) ~= 0 then
            vim.cmd('Neotree current dir=' .. f)
            -- neo-tree is loaded now, delete the init autocmd
            vim.api.nvim_clear_autocmds({ group = 'neo-tree-init' })
          end
        end
      })

      require('neo-tree').setup({
        close_if_last_window = false,
        popup_border_style = Util.PREFERRED_BORDER_STYLE,
        -- open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
        default_component_configs = {
          modified = {
            symbol = '[+]',
            highlight = 'NeoTreeModified'
          },
          name = {
            trailing_slash = true,
            use_git_status_colors = true,
            highlight = 'NeoTreeFileName'
          },
          file_size = { enabled = false },
          type = { enabled = false },
          last_modified = { enabled = false },
          created = { enabled = false },
          symlink_target = { enabled = false }
        },
        event_handlers = {
          {
            event = 'file_open_requested',
            handler = function(_)
              require('neo-tree.command').execute({ action = 'close' })
            end
          }
        },
        window = {
          position = 'left',
          width = 32,
          mapping_options = {
            noremap = true,
            nowait = true
          },
          mappings = {
            ['<2-LeftMouse>'] = 'open',
            ['<CR>'] = 'open',
            ['o'] = 'open',
            ['<Esc>'] = 'cancel', -- close preview or floating neo-tree window
            ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = false } },
            -- Read `# Preview Mode` for more information
            ['l'] = 'focus_preview',
            ['s'] = 'open_split',
            ['S'] = 'open_vsplit',
            -- ['S'] = 'split_with_window_picker',
            -- ['s'] = 'vsplit_with_window_picker',
            ['t'] = 'open_tabnew',
            -- ['<cr>'] = 'open_drop',
            -- ['t'] = 'open_tab_drop',
            -- ['w'] = 'open_with_window_picker',
            --['P'] = 'toggle_preview', -- enter preview mode, which shows the current node without focusing
            ['C'] = 'close_node',
            -- ['C'] = 'close_all_subnodes',
            ['z'] = 'close_all_nodes',
            --['Z'] = 'expand_all_nodes',
            ['a'] = {
              'add',
              -- this command supports BASH style brace expansion ('x{a,b,c}' -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = 'none', -- 'none', 'relative', 'absolute'
              },
            },
            -- ['A'] = 'add_directory', -- also accepts the optional config.show_path option like 'add'. this also supports BASH style brace expansion.
            ['dd'] = 'delete',
            ['r'] = 'rename',
            -- ['b'] = 'rename_basename',
            ['y'] = 'copy_to_clipboard',
            -- ['x'] = 'cut_to_clipboard',
            ['p'] = 'paste_from_clipboard',
            ['c'] = 'copy', -- takes text input for destination, also accepts the optional config.show_path option like 'add':
            -- ['c'] = {
            --  'copy',
            --  config = {
            --    show_path = 'none' -- 'none', 'relative', 'absolute'
            --  }
            --}
            ['m'] = 'move', -- takes text input for destination, also accepts the optional config.show_path option like 'add'.
            ['q'] = 'close_window',
            ['R'] = 'refresh',
            ['?'] = 'show_help',
            ['<'] = 'prev_source',
            ['>'] = 'next_source',
            ['i'] = 'show_file_details',
            -- ['i'] = {
            --   'show_file_details',
            --   -- format strings of the timestamps shown for date created and last modified (see `:h os.date()`)
            --   -- both options accept a string or a function that takes in the date in seconds and returns a string to display
            --   -- config = {
            --   --   created_format = '%Y-%m-%d %I:%M %p',
            --   --   modified_format = 'relative', -- equivalent to the line below
            --   --   modified_format = function(seconds) return require('neo-tree.utils').relative_date(seconds) end
            --   -- }
            -- },
          },
        },
        filesystem = {
          hijack_netrw_behavior = 'open_current'
        }
      })

      Util.set_mapping('n', '<Leader>tt', function()
        require('neo-tree.command').execute({
          toggle = true,
          source = 'filesystem',
          position = 'float',
        })
      end, { desc = 'Toggle Neotree' })
    end
  },
  {
    'numToStr/FTerm.nvim',
    config = function()
      require'FTerm'.setup({
        border = Util.PREFERRED_BORDER_STYLE,
        dimensions  = {
          height = 0.9,
          width = 0.9,
        },
      })

      -- Alt-based keybindings
      vim.keymap.set('n', '<M-q>', '<CMD>lua require("FTerm").toggle()<CR>')
      vim.keymap.set('t', '<M-q>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    end
  },
  -- {
  --   'SidOfc/carbon.nvim',
  --   config = function()
  --     require('carbon').setup()
  --   end
  -- },
}

