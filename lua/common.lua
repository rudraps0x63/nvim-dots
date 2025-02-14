-- [Global settings]
local M = {}

-- [Autogroups/Autocommands]
local buffer = 'Buffer'
local files = 'Files'

vim.api.nvim_create_augroup(buffer, { clear = true })
vim.api.nvim_create_augroup(files, { clear = true })

local function setup_essentials()
  vim.g.mapleader = ','
  vim.g.loaded_netrw = 1 -- For NvimTree

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
end

local function setup_buffer_group_commands()
  -- Highlight yanked text for 200ms
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = buffer,
    pattern = '*',
    callback = function()
      vim.highlight.on_yank({ timeout = 200 }) -- :h lua-highlight
    end
  })
end

local function setup_file_group_commands()
  -- If file is .c or .cpp, tabs are equal to 2 spaces
  vim.api.nvim_create_autocmd('FileType', {
    group = files,
    pattern = { 'c', 'cpp', 'lua', 'cmake' },
    callback = function()
      vim.o.tabstop = 2
      vim.o.shiftwidth = 2
    end
  })
end

M.setup = function()
  setup_essentials()

  setup_buffer_group_commands()
  setup_file_group_commands()
end

return M

