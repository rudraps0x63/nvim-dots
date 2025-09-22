return {
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
}

