return {
  {
    'savq/melange-nvim',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme('melange')
    end
  },
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

      -- vim.cmd('colorscheme vague')
      -- vim.cmd('highlight IncSearch gui=bold guifg=#13151a guibg=#a2b2db')
      -- vim.cmd('highlight MatchParen gui=bold guifg=#cdcdcd guibg=#363738')
      -- vim.cmd('highlight IblIndent guifg=#2b2d36')
      -- vim.cmd('highlight IblScope gui=none guifg=#8a8fa8')
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
  -- {
  --   "webhooked/kanso.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Default options:
  --     require('kanso').setup({
  --       bold = true,                 -- enable bold fonts
  --       italics = true,             -- enable italics
  --       compile = false,             -- enable compiling the colorscheme
  --       undercurl = true,            -- enable undercurls
  --       commentStyle = { italic = false },
  --       functionStyle = {},
  --       keywordStyle = { bold = true, italic = false },
  --       statementStyle = {},
  --       typeStyle = {},
  --       transparent = true,         -- do not set background color
  --       dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
  --       terminalColors = true,       -- define vim.g.terminal_color_{0,17}
  --       colors = {                   -- add/modify theme and palette colors
  --       },
  --       background = {               -- map the value of 'background' option to a theme
  --         dark = "ink",           -- try "zen", "mist" or "pearl" !
  --         light = "ink"           -- try "zen", "mist" or "pearl" !
  --       },
  --       foreground = 'default',      -- "default" or "saturated" (can also be a table like background)
  --     })
  --
  --     -- setup must be called before loading
  --     vim.cmd("colorscheme kanso")
  --   end
  -- },
  {
    'aliqyan-21/darkvoid.nvim',
    lazy = false,
    priority = 1001,
    config = function()
      require('darkvoid').setup({
        -- transparent = true,
        glow = false,
        show_end_of_buffer = false,
        colors = {
          -- type_builtin = "#ffffc5",
          string = '#a49bd1',
          -- string = '#94baca', -- Raider muted cyan
        }
      })

      vim.cmd.colorscheme('darkvoid')

      vim.cmd('hi NormalFloat guibg=#1c1c1c')
      vim.cmd('hi StatusLine guifg=black guibg=#e3e1cf gui=none')
      vim.cmd('hi @keyword guifg=#ffffc5 gui=bold')
      -- vim.cmd('hi @keyword guifg=#8fa89e gui=bold')
      vim.cmd('hi! link @keyword.return @keyword')
      vim.cmd('hi NonText guifg=#878282')
      -- vim.cmd('hi @keyword.return guifg=#ffffc5 gui=bold')
      vim.cmd('hi IblIndent gui=none guifg=#2f2f33')
      vim.cmd('hi IblScope gui=none guifg=#8a8fa8')
      vim.cmd('hi Search gui=bold guibg=#1bfd9c guifg=#000000')
      vim.cmd('hi IncSearch gui=bold guibg=#1bfd9c guifg=#000000')

      -- vim.cmd('hi Normal guibg=#222222')
      -- vim.cmd('hi @keyword guifg=#858ca6 gui=bold')
      -- vim.cmd('hi @keyword.return guifg=#858ca6 gui=bold')
      --
      -- -- vim.cmd('hi @keyword.function guifg=#858ca6 gui=none')
      -- -- vim.cmd('hi! link @function @keyword.function')
      -- --
      -- -- vim.cmd('hi! link Function @function')
      -- -- vim.cmd('hi Identifier guifg=#96a8a1')
      --
      -- vim.cmd('hi NormalFloat guibg=#1c1c1c')
      -- vim.cmd('hi StatusLine guifg=black guibg=#e3e1cf gui=none')
      -- vim.cmd('hi Search gui=bold guibg=#1bfd9c guifg=#000000')
      -- vim.cmd('hi IncSearch gui=bold guibg=#ecb55d guifg=#222222')
      -- vim.cmd('hi IblIndent gui=none guifg=#302f2d')
      -- vim.cmd('hi IblScope gui=none guifg=#8a8fa8')
    end
  },
  -- {
  --   'andreypopp/vim-colors-plain',
  --   lazy = false,
  --   config = function()
  --     vim.cmd.colorscheme('plain')
  --   end
  -- },
}

