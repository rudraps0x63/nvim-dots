return {
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
    }
    )
  end
}

