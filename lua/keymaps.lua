local M = {}
local Util = require('util')

M.setup = function()
    local nt_api = require('nvim-tree.api')
    local builtin = require('telescope.builtin')

    if nt_api ~= nil then
        Util.set_mapping('n', '<Leader>tt', nt_api.tree.toggle)
        Util.set_mapping('n', '<Leader>T', nt_api.tree.open)
    end

    if builtin ~= nil then
        local apply_func_dir_under_cursor = function(builtin_func)
            local cursor_dir = nt_api.tree.get_node_under_cursor()

            if (cursor_dir ~= nil) and (cursor_dir['type'] == 'directory') then
                builtin_func({
                    cwd = cursor_dir['absolute_path']
                })
            else
                builtin_func()
            end
        end

        Util.set_mapping('n', '<Leader>ff', builtin.find_files)
        Util.set_mapping('n', '<Leader>F', function() apply_func_dir_under_cursor(builtin.find_files) end)

        Util.set_mapping('n', '<Leader>lg', builtin.live_grep)
        Util.set_mapping('n', '<Leader>Lg', function() apply_func_dir_under_cursor(builtin.live_grep) end)

        Util.set_mapping('n', '<Leader>bb', builtin.buffers)

        Util.set_mapping('n', '<Leader>re', builtin.resume)
    end

    Util.set_mapping('n', '<Leader>1', '<cmd>bnext<CR>')
    Util.set_mapping('n', '<Leader>2', '<cmd>bprev<CR>')

    Util.set_mapping('n', '<Space>tt', function()
        vim.cmd('new')
        vim.cmd('term')
        vim.api.nvim_win_set_height(0, 15)
    end)
end

return M

