local Util = require('util.util')

return {
  'numToStr/FTerm.nvim',
  config = function()
    require'FTerm'.setup({
      border = Util.PREFERRED_BORDER_STYLE,
      dimensions  = { height = 0.9, width = 0.9 },
    })

    -- Alt-based keybindings
    vim.keymap.set('n', '<M-q>', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<M-q>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end
}

