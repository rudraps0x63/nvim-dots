local M = {}
local ENV_HOME = os.getenv('HOME') or ''
local PREFERRED_BORDER_STYLE = 'rounded'

M.ENV_HOME = ENV_HOME
M.PREFERRED_BORDER_STYLE = PREFERRED_BORDER_STYLE

M.set_mapping = function(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

M.unset_mapping = function(mode, lhs, opts)
    vim.keymap.del(mode, lhs, opts)
end

M.write_to_dummy_file = function(fname, contents, flag)
    local file = io.open(fname, flag or 'w')

    io.output(file)

    if contents ~= nil then
        io.write(contents)
    end

    io.close()
end

M.create_floating_window = function(data, opts)
    opts = opts or {}
    local uri = data.targetUri or data.uri
    local range = data.targetRange or data.range

    if uri == nil then
        return
    end

    local decoded_uri = vim.uri_decode(uri)
    local flbufpos = { range.start.line + 1, range.start.character }

    -- If incoming uri is same as the floating window we are in,
    -- don't open another, just set the cursor posi
    if vim.api.nvim_win_get_config(0).relative ~= ''
        and vim.uri_from_bufnr(0) == decoded_uri then
        vim.api.nvim_win_set_cursor(0, flbufpos)
        return
    end

    -- Create unmodifiable buffer and its cursor posi
    local flbuf = vim.uri_to_bufnr(uri)
    vim.bo[flbuf].modifiable = opts.modifiable or false

    -- Window options
    local width = opts.width or math.floor(vim.o.columns * 0.65)
    local height = opts.height or math.floor(vim.o.lines * 0.50)
    local winopts = vim.lsp.util.make_floating_popup_options(width, height)
    winopts.title = string.gsub(vim.uri_to_fname(decoded_uri), ENV_HOME, ' ~') .. ' '
    winopts.border = PREFERRED_BORDER_STYLE

    -- If enter == true, the below autocmds cause
    -- window to close immediately.
    local flwin = vim.api.nvim_open_win(flbuf, true, winopts)

    -- Scroll window to defintion
    vim.api.nvim_win_set_cursor(flwin, flbufpos)

    -- With minimal style the line numbering is removed
    vim.wo[flwin].nu = true
    vim.wo[flwin].rnu = true

    -- vim.api.nvim_create_autocmd(events, {
    --     once = true,
    --     -- group = vim.api.nvim_create_augroup('PreviewWindow', { clear = true }),
    --     callback = function()
    --         sidx = sidx + 1
    --         print('Called with: ' .. sidx .. ':' .. vim.inspect(events))
    --         -- pcall(vim.api.nvim_win_close, win, true)
    --         vim.api.nvim_win_close(win, false)

    --         return true
    --     end
    -- })
end

return M

