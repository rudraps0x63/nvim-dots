local M = {}

M.setup = function()
  vim.g.mapleader = ','
  vim.g.loaded_netrw = 1

  vim.o.nu = true
  vim.o.rnu = true

  vim.o.tabstop = 4
  vim.o.shiftwidth = 4
  vim.o.expandtab = true

  vim.o.cursorline = true
  vim.o.termguicolors = true

  vim.o.hlsearch = false
  vim.o.incsearch = true

  -- Split windows on right and below
  vim.o.splitright = true
  vim.o.splitbelow = true

  vim.o.swapfile = false

  -- Autocommands
  -- Highlight yanked text for 200ms
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('Buffer', { clear = true }),
    pattern = '*',
    callback = function()
      vim.highlight.on_yank({ timeout = 200 }) -- :h lua-highlight
    end
  })

  -- If file is .c or .cpp, tabs are equal to 2 spaces
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('Files', { clear = true }),
    pattern = { 'c', 'cpp', 'lua', 'cmake', 'javascript' },
    callback = function()
      vim.o.tabstop = 2
      vim.o.shiftwidth = 2
    end
  })
end

return M

