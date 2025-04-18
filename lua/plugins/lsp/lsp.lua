local Util = require('util.util')

return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    priority = 1000,
    config = function()
      local lspconfig = require('lspconfig')
      local ms = vim.lsp.protocol.Methods

      local sv_configuration = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }
              }
            }
          },
        },
        clangd = {
          init_options = {
            fallbackFlags = { '-std=c++20' }
          }
        },
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              check = { command = 'clippy' },
              diagnostics = { enable = true }
            }
          }
        }
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client.supports_method(ms.textDocument_definition) then
            Util.set_mapping('n', '<Leader>gd', function()
              vim.lsp.buf.definition()
            end, { desc = 'Jump to definition (new tab, unlisted buffer)' })

            Util.set_mapping('n', '<Leader>Pd', function()
              local method_params = vim.lsp.util.make_position_params()
              local callback = function(err, result)
                if err ~= nil or result == nil then
                  print(ms.textDocument_definition .. ': empty response: ' .. vim.inspect(err))

                  return
                end

                -- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/lsp/util.lua#L987
                Util.create_unlisted_tab(result[1] or result)
              end

              client.request(ms.textDocument_definition, method_params, callback) -- Async call
            end, { desc = 'Jump to definition (new tab, unlisted buffer)' })

            Util.set_mapping('n', '<Leader>pd', function()
              local method_params = vim.lsp.util.make_position_params()
              local callback = function(err, result)
                if err ~= nil or result == nil then
                  print(ms.textDocument_definition .. ': empty response: ' .. vim.inspect(err))

                  return
                end

                -- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/lsp/util.lua#L987
                Util.create_floating_window(result[1] or result, { bufnr = bufnr })
              end

              client.request(ms.textDocument_definition, method_params, callback) -- Async call
            end, { desc = 'Peek at definition' })
          end

          if client.supports_method(ms.textDocument_implementation) then
            Util.set_mapping('n', '<Leader>gi', vim.lsp.buf.implementation, {
              desc = 'Jump to implementation [?]'
            })
          end

          if client.supports_method(ms.textDocument_hover) then
            Util.set_mapping('n', 'K', vim.lsp.buf.hover, {
              desc = 'Get hover information'
            })
          end
        end
      })

      for sv, config in pairs(sv_configuration) do
        lspconfig[sv].setup({
          settings = config.settings or {},
          init_options = config.init_options or {},
          capabilities = require('blink.cmp').get_lsp_capabilities(),
          handlers = {
            [ms.textDocument_hover] = vim.lsp.with(vim.lsp.handlers[ms.textDocument_hover], {
              border = Util.PREFERRED_BORDER_STYLE
            })
          }
        })
      end
    end
  },
  -- {
  --   'rmagatti/goto-preview',
  --   lazy = true,
  --   event = 'BufEnter',
  --   config = function()
  --     require('goto-preview').setup({
  --       default_mappings = true
  --     })
  --   end
  -- }
}

