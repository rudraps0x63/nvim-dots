local M = {}
local api = vim.api

local zindex = 1
local win_stack = {} -- Map of actual window handles (non floats) to arrays of window handles (floats)

M.ENV_HOME = os.getenv('HOME') or ''
M.PREFERRED_BORDER_STYLE = 'rounded'

LSP_HEIRARCHY_FLOAT_VAR = 'lsp-heirarchy:var:is_float'
LSP_HEIRARCHY_GROUP_NAME = 'lsp-heirarchy:augroup:win_closed'

M.set_mapping = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.unset_mapping = function(mode, lhs, opts)
  vim.keymap.del(mode, lhs, opts)
end

local find_in_table = function(tbl, key)
  for k, v in pairs(tbl) do
    if k == key then
      return v
    end
  end
  return nil
end

M.write_to_dummy_file = function(fname, contents, flag)
  local file = io.open(fname, flag or 'w')

  io.output(file)

  if contents ~= nil then
    io.write(contents)
  end

  io.close()
end

-- Search if a buffer with same uri as `decoded_uri` is open in `fl_win_list`
local is_same_buffer_loaded = function(decoded_uri, fl_win_list)
  local i = #fl_win_list

  while i ~= 0 do
    local buf = api.nvim_win_get_buf(fl_win_list[i])

    if vim.uri_from_bufnr(buf) == decoded_uri then
      return i, fl_win_list[i]
    end

    i = i - 1
  end

  return 0, nil
end

M.create_unlisted_tab = function(data, opts)
  -- opts = opts or {}
  -- local uri = data.targetUri or data.uri
  -- local range = data.targetRange or data.range
  --
  -- if uri == nil then
  --   return
  -- end
  --
  -- local decoded_uri = vim.uri_decode(uri)
  -- local cursor_pos = { range.start.line + 1, range.start.character }
  --
  -- local fl_buf = vim.uri_to_bufnr(uri)
  -- vim.bo[fl_buf].buflisted = false
  -- vim.bo[fl_buf].modifiable = opts.modifiable or false
  --
  -- vim.cmd('tabnew')
  --
  -- local winnr = api.nvim_tabpage_get_win(0)
  -- api.nvim_win_set_buf(winnr, fl_buf);
  -- api.nvim_win_set_cursor(winnr, cursor_pos)
end

local is_win_in_heirarchy = function(win)
  local is_float, _ = pcall(api.nvim_win_get_var, win, LSP_HEIRARCHY_FLOAT_VAR)

  if is_float or win_stack[win] ~= nil then
    return true
  end

  return false
end

local get_parent_win_from_var = function(win)
  local ok, parent_win = pcall(api.nvim_win_get_var, win, LSP_HEIRARCHY_FLOAT_VAR)

  if not ok then
    return win
  end

  return tonumber(parent_win)
end

local close_win = function(data)
  -- print(vim.inspect(data))
  -- local autocmds = api.nvim_get_autocmds({ group = data.group })
  -- print(vim.inspect(autocmds))
  -- local gname = autocmds[1].group_name
  -- if gname ~= LSP_HEIRARCHY_GROUP_NAME then
  --   print("Leaving as gname: " .. vim.inspect(gname))
  --   return
  -- end
  --
  -- print("NOT Leaving as gname: " .. gname)

  -- print("NOT Leaving as : " .. data.id .. '==' .. autocmd_id)

  local win = api.nvim_get_current_win();
  local fl_win_list = win_stack[get_parent_win_from_var(win)];

  if fl_win_list == nil then -- If window not in hierarchy, return
    return
  end

  local len = #fl_win_list
  local i = len

  while i ~= 0 do
    local cur_win = fl_win_list[i]

    if cur_win == win then
      local j = i

      -- print('Removing from posi: ' .. j .. ', total: ' .. len)

      while j < len do
        fl_win_list[j] = fl_win_list[j + 1]
        j = j + 1
      end
      fl_win_list[j] = nil

      break
    end

    i = i - 1
  end

  if #fl_win_list >= 1 then -- If final list has at least one float
    api.nvim_set_current_win(fl_win_list[#fl_win_list])
  end

  -- print('Closing window, fl_win_list sz before/after: ' .. len .. ',' .. #fl_win_list)

  return false
end

M.create_floating_window = function(data, opts)
  opts = opts or {}
  local uri = data.targetUri or data.uri
  local range = data.targetRange or data.range

  if uri == nil then
    return
  end

  local decoded_uri = vim.uri_decode(uri)
  local cursor_pos = { range.start.line + 1, range.start.character }
  local cur_win = api.nvim_get_current_win()
  local cur_win_is_relative = api.nvim_win_get_config(cur_win).relative ~= ''

  -- Check if caller window (`cur_win`) is itself a float or should start a new stack in `win_stack`
  if not cur_win_is_relative then
    win_stack[cur_win] = win_stack[cur_win] or {} -- Start a new stack
  end

  local parent_win = get_parent_win_from_var(cur_win)

  -- Check if the requested buffer is open already in stack of `parent_win`
  local _, win = is_same_buffer_loaded(decoded_uri, win_stack[parent_win])

  if win ~= nil then
    api.nvim_set_current_win(win)
    api.nvim_win_set_cursor(win, cursor_pos)

    return
  end

  local winopts = vim.lsp.util.make_floating_popup_options(1, 1, {
    zindex = zindex + 1,
    border = M.PREFERRED_BORDER_STYLE
  })

  winopts.relative = 'cursor'
  winopts.width = opts.width or math.floor(api.nvim_win_get_width(parent_win) * 0.85)
  winopts.height = opts.height or math.floor(api.nvim_win_get_height(parent_win) * 0.50)
  winopts.title = string.gsub(vim.uri_to_fname(decoded_uri), M.ENV_HOME, ' ~') .. ' '
  winopts.border = M.PREFERRED_BORDER_STYLE

  -- Create unmodifiable buffer and its cursor posi
  local fl_buf = vim.uri_to_bufnr(uri)

  -- If buffer is listed, use its modifiable option value.
  -- If not, disallow modification and wipe on close
  if not vim.bo[fl_buf].buflisted then
    vim.bo[fl_buf].bufhidden = 'wipe'
    vim.bo[fl_buf].modifiable = false
  else
    winopts.title = ' [*]' .. winopts.title
  end

  -- If enter == true, the 'CursorMoved', 'CursorMovedI' and 'InsertCharPre' autocmds
  -- cause float win to close immediately
  local fl_win = api.nvim_open_win(fl_buf, true, winopts)

  table.insert(win_stack[parent_win], fl_win)
  api.nvim_win_set_var(fl_win, LSP_HEIRARCHY_FLOAT_VAR, parent_win)

  vim.wo[fl_win].nu = true -- With minimal style the line numbering is removed
  vim.wo[fl_win].rnu = true
  api.nvim_win_set_cursor(fl_win, cursor_pos)

  -- Create closing events depending on type of window
  _ = api.nvim_create_autocmd('WinClosed', {
    group = api.nvim_create_augroup(LSP_HEIRARCHY_GROUP_NAME, { clear = true }),
    callback = close_win
  })
end

return M

