return {
  {
    'savq/melange-nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- vim.cmd('colorscheme melange')
    end
  },
  -- {
  --     'fenetikm/falcon',
  --     lazy = false,
  --     priority = 1000,
  --     config = function()
  --         -- vim.cmd([[colorscheme falcon]])
  --     end
  -- },
  -- {
  --     'ribru17/bamboo.nvim',
  --     lazy = false,
  --     priority = 1000,
  --     config = function()
  --         -- vim.cmd('colorscheme bamboo')
  --     end,
  -- },
  -- {
  --     'techtuner/aura-neovim',
  --     lazy = false,
  --     priority = 1000,
  --     config = function()
  --         -- vim.cmd('colorscheme aura')
  --     end
  -- },
  -- {
  --     'Domeee/mosel.nvim',
  --     lazy = false,
  --     priority = 1000,
  --     config = function()
  --         -- vim.cmd('colorscheme mosel')
  --     end
  -- },
  -- {
  --   'ramojus/mellifluous.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('mellifluous').setup({}) -- optional, see configuration section.
  --     vim.cmd('colorscheme mellifluous')
  --   end,
  -- },
  -- {
  --     'DanielEliasib/sweet-fusion',
  --     name = 'sweet-fusion',
  --     priority = 1000,
  --     opts = {
  --         transparency = true,
  --         dim_inactive = true,
  --         hl_styles = {
  --             bold = true,
  --             comments = { italic = false },
  --             keywords = { italic = false },
  --             functions = { italic = false },
  --             variables = { }
  --         },
  --     },
  --     config = function()
  --         vim.cmd('colorscheme sweet-fusion')
  --     end
  -- },
  -- {
  --     'metalelf0/jellybeans-nvim',
  --     lazy = false,
  --     priority = 1000,
  --     dependencies = { 'rktjmp/lush.nvim' },
  --     config = function()
  --         -- vim.cmd('colorscheme jellybeans-nvim')
  --     end
  -- },
  {
    'dgox16/oldworld.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('oldworld').setup({
        variant = 'default',
        styles = {
          keywords = { italic = false, bold = true },
          booleans = { bold = true }
        },
        integrations = {
          telescope = false,
        },
        highlight_overrides = {
          Normal = { bg = 'none' },
          IblScope = { fg = '#6a647d' },
          MatchParen = { bold = true, fg = '#c9c1d4', bg = '#343038' },
        }
      })

      -- vim.cmd('colorscheme oldworld')
    end
  },
  {
    'vague2k/vague.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('vague').setup({
        transparent = true, -- don't set background
        style = {
          -- 'none' is the same thing as default. But 'italic' and 'bold' are also valid options
          boolean = 'bold',
          number = 'none',
          float = 'none',
          error = 'bold',
          comments = 'italic',
          conditionals = 'bold',
          functions = 'none',
          headings = 'bold',
          operators = 'none',
          strings = 'none',
          variables = 'none',

          -- keywords
          keywords = 'bold',
          keyword_return = 'bold',
          keywords_loop = 'bold',
          keywords_label = 'bold',
          keywords_exception = 'bold',

          -- builtin
          builtin_constants = 'none',
          builtin_functions = 'none',
          builtin_types = 'bold',
          builtin_variables = 'none',
        },
      })

      vim.cmd('colorscheme vague')
      vim.cmd('highlight IncSearch gui=bold guifg=#13151a guibg=#a2b2db')
      vim.cmd('highlight MatchParen gui=bold guifg=#cdcdcd guibg=#363738')
      vim.cmd('highlight IblIndent guifg=#2b2d36')
      vim.cmd('highlight IblScope gui=none guifg=#8a8fa8')
    end
  },
  -- {
  --   "anAcc22/sakura.nvim",
  --   dependencies = {
  --     'rktjmp/lush.nvim'
  --   },
  --   lazy = false,
  --   config = function()
  --     vim.cmd.colorscheme("sakura");
  --     vim.cmd('hi Normal guibg=none');
  --   end
  -- }
  -- {
  --   'rhysd/vim-color-spring-nigh',
  --   lazy = false,
  --   config = function()
  --     vim.cmd('colorscheme spring-night')
  --   end
  -- },
}

