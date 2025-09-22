local Util = require('util.util')

return {
  'rlane/pounce.nvim',
  lazy = false,
  config = function()
    local pounce = require('pounce')
    pounce.setup({ accept_keys = "jfkdlsahgnuvrbytmiceoxwpqz" })

    Util.set_mapping('n', 's', function() pounce.pounce({}) end, {
      desc = 'Fuzzy search and pounce'
    })
    Util.set_mapping('v', 's', function() pounce.pounce({}) end, {
      desc = 'Fuzzy search and pounce in visual mode'
    })
    Util.set_mapping('n', 'S', function() pounce.pounce({ do_repeat = true }) end, {
      desc = 'Fuzzy search and pounce repeat'
    })
  end
}

