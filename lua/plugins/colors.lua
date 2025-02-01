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
    --     'mcchrish/zenbones.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- vim.g.zenbones_compat = 1
    --         -- vim.cmd('colorscheme zenbones')
    --     end
    -- },
    -- {
    --     'projekt0n/github-nvim-theme',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- vim.cmd([[colorscheme github_dark_high_contrast]])
    --     end
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
    --     'blazkowolf/gruber-darker.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         bold = true,
    --         invert = {
    --             signs = false,
    --             tabline = false,
    --             visual = false,
    --         },
    --         italic = {
    --             strings = false,
    --             comments = false,
    --             operators = false,
    --             folds = false,
    --         },
    --         undercurl = false,
    --         underline = false,
    --     },
    --     config = function()
    --         -- vim.cmd([[colorscheme gruber-darker]])
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
    --     'heraldofsolace/nisha-vim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         --vim.cmd([[colorscheme nisha]])
    --     end
    -- },
    -- {
    --     'ramojus/mellifluous.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- require('mellifluous').setup({}) -- optional, see configuration section.
    --         -- vim.cmd('colorscheme mellifluous')
    --     end,
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
    --         -- vim.cmd('colorscheme sweet-fusion')
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
    --     'scottmckendry/cyberdream.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- vim.cmd('colorscheme cyberdream')
    --     end
    -- },
    {
        'comfysage/gruvboxed',
        lazy = false,
        config = function()
            require('gruvboxed').setup({
                style = {
                    tabline = { reverse = false, color = 'green' },
                    search = { reverse = false, inc_reverse = true },
                    types = { italic = false },
                    keyword = { italic = false, bold = true },
                    comment = { italic = false },
                }
            })
            -- vim.cmd('colorscheme gruvboxed')
        end
    },
    {
        'dgox16/oldworld.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('oldworld').setup({
                styles = {
                    keywords = { italic = false, bold = true },
                    booleans = { bold = true }
                },
                integrations = {
                    telescope = false,
                },
                highlight_overrides = {
                    MatchParen = { bold = true, fg = '#c9c1d4', bg = '#343038' },
                    IblScope = { fg = '#6a647d' },
                }
            })

            -- vim.cmd('colorscheme oldworld')
        end
    },
    {
        'vague2k/vague.nvim',
        lazy = false,
        config = function()
            require('vague').setup({
                transparent = true, -- don't set background
                style = {
                    -- 'none' is the same thing as default. But 'italic' and 'bold' are also valid options
                    boolean = 'bold',
                    number = 'none',
                    float = 'none',
                    error = 'none',
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
            vim.cmd('highlight IblIndent guifg=#1e1e24')
            vim.cmd('highlight IblScope gui=bold guifg=#8a8fa8')
        end
    },
    -- {
    --     "thesimonho/kanagawa-paper.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         -- local theme, palette = require('kanagawa-paper.colors').setup({ sumiInk3 = '#12120f' })

    --         require('kanagawa-paper').setup({
    --             undercurl = true,
    --             transparent = false,
    --             gutter = true,
    --             dimInactive = true, -- disabled when transparent
    --             terminalColors = true,
    --             commentStyle = { italic = true },
    --             functionStyle = { italic = false },
    --             keywordStyle = { italic = false, bold = true },
    --             statementStyle = { italic = false, bold = false },
    --             typeStyle = { italic = false },
    --             colors = {
    --                 palette = {
    --                     -- sumiInk3 = "#12120f",
    --                 }
    --             }, -- override default palette and theme colors
    --             overrides = function()  -- override highlight groups
    --                 return {}
    --             end,
    --         })

    --         -- setup must be called before loading
    --         -- vim.cmd("colorscheme kanagawa-paper")
    --     end
    -- },
    -- {
    --     'sainnhe/gruvbox-material',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- vim.g.gruvbox_material_enable_italic = true
    --         -- vim.cmd.colorscheme('gruvbox-material')
    --     end
    -- }
}

