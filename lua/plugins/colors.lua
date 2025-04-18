return {
  -- {
  --   'alejandrolaguna20/noctis.nvim',
  --   config = function()
  --     -- vim.cmd.colorscheme('noctis')
  --   end,
  -- },
  -- {
  --   "racagogi/mytilus",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require("mytilus.configs").setup(
  --       {
  --         theme    = 'dark',
  --         options  = {
  --           sideBarDim = true, --if false then sidebar bg is same normal
  --           statusBarRevers = true, --if false, statusBarRevers bg is d2_black,
  --           NCWindowDim = true, --if false, not current window bg is same normal
  --           func = { bold = true },
  --           type = {},
  --           statement = {},
  --           keyword = { bold = true },
  --           constant = { bold = true },
  --           comment = {},
  --           doc = {},
  --         },
  --         overides = {} -- ["@string"] = { fg = "#222222", italic = true },
  --       }
  --     )
  --
  --     vim.cmd [[colorscheme mytilus]]
  --   end
  -- },
  -- {
  --   '34-c/zenburn-m',
  --   config = function()
  --     vim.cmd.colorscheme('zenburn-m')
  --   end
  -- },
  -- {
  --     'fenetikm/falcon',
  --     lazy = false,
  --     priority = 1000,
  --     config = function()
  --         -- vim.cmd([[colorscheme falcon]])
  --     end
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
  -- {
  --   'dgox16/oldworld.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('oldworld').setup({
  --       variant = 'default',
  --       styles = {
  --         keywords = { italic = false, bold = true },
  --         booleans = { bold = true }
  --       },
  --       integrations = {
  --         telescope = false,
  --       },
  --       highlight_overrides = {
  --         Normal = { bg = 'none' },
  --         IblScope = { fg = '#6a647d' },
  --         MatchParen = { bold = true, fg = '#c9c1d4', bg = '#343038' },
  --       }
  --     })
  --
  --     -- vim.cmd('colorscheme oldworld')
  --   end
  -- },
  {
    'vague2k/vague.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('vague').setup({
        transparent = false, -- don't set background
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

      -- vim.cmd('colorscheme vague')
      -- vim.cmd('highlight IncSearch gui=bold guifg=#13151a guibg=#a2b2db')
      -- vim.cmd('highlight MatchParen gui=bold guifg=#cdcdcd guibg=#363738')
      -- vim.cmd('highlight IblIndent guifg=#2b2d36')
      -- vim.cmd('highlight IblScope gui=none guifg=#8a8fa8')
    end
  },
  {
    'aliqyan-21/darkvoid.nvim',
    lazy = false,
    priority = 1001,
    config = function()
      require('darkvoid').setup({
        transparent = true,
        glow = false,
        show_end_of_buffer = false,
        colors = {
          -- string = '#acfffc'
          string = '#a9a2e0'
        }
      })

      vim.cmd.colorscheme('darkvoid')
      -- vim.cmd('hi Normal guibg=none')
      vim.cmd('hi NormalFloat guibg=#1c1c1c')
      -- vim.cmd('hi StatusLine guibg=none')
      vim.cmd('hi @keyword guifg=#ffffc5 gui=bold')
      vim.cmd('hi! link @keyword.return @keyword')
      -- vim.cmd('hi @keyword.return guifg=#ffffc5 gui=bold')
      vim.cmd('hi IblIndent gui=none guifg=#232326')
      vim.cmd('hi IblScope gui=none guifg=#8a8fa8')
      vim.cmd('hi Search gui=bold guibg=#1bfd9c guifg=#000000')
      vim.cmd('hi IncSearch gui=bold guibg=#1bfd9c guifg=#000000')
    end
  },
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   -- Add in any other configuration; 
  --   --   event = foo, 
  --   config = function ()
  --     -- vim.cmd.colorscheme('oxocarbon')
  --   end
  --   --   end,
  -- },
  -- {
  --   "rockyzhang24/arctic.nvim",
  --   branch = "v2",
  --   dependencies = { "rktjmp/lush.nvim" },
  --   config = function()
  --     vim.cmd.colorscheme('arctic')
  --   end
  -- },
  -- {
  --   'hsi/lapland.nvim',
  --   config = function()
  --     vim.cmd.colorscheme('lapland')
  --
  --     vim.cmd('highlight IncSearch gui=bold guifg=#13151a guibg=#a2b2db')
  --     vim.cmd('highlight MatchParen gui=bold guifg=#cdcdcd guibg=#363738')
  --     vim.cmd('highlight IblIndent guibg=none guifg=#2b2d36')
  --     vim.cmd('highlight IblWhitespace guibg=none guifg=#2b2d36')
  --     vim.cmd('highlight IblScope gui=none guibg=none guifg=#8a8fa8')
  --   end
  -- },
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
  -- },
}

