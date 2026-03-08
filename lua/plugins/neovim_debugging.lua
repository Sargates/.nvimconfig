return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "jbyuki/one-small-step-for-vimkind",
        },
        lazy = false,
        config = function()
            local dap = require"dap"
            dap.configurations.lua = {
                {
                    type = 'nlua',
                    request = 'attach',
                    name = "Attach to running Neovim instance",
                }
            }

            dap.adapters.nlua = function(callback, config)
                callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
            end

            vim.keymap.set('n', '<leader>db', require"dap".toggle_breakpoint, { noremap = true , desc = "Breakpoint: Toggle" })
            vim.keymap.set('n', '<leader>dc', require"dap".continue,          { noremap = true , desc = "Breakpoint: Continue" })
            vim.keymap.set('n', '<leader>do', require"dap".step_over,         { noremap = true , desc = "Step Over" })
            vim.keymap.set('n', '<leader>di', require"dap".step_into,         { noremap = true , desc = "Step Into" })

            vim.keymap.set('n', '<leader>dl', function()
                require"osv".launch({port = 8086})
            end,                                                              { noremap = true , desc = "Launch DAP Server" })

            vim.keymap.set('n', '<leader>dw', function()
                local widgets = require"dap.ui.widgets"
                widgets.hover()
            end,                                                              { noremap = true , desc = "Widget (Hover)" })

            vim.keymap.set('n', '<leader>df', function()
                local widgets = require"dap.ui.widgets"
                widgets.centered_float(widgets.frames)
            end,                                                              { noremap = true , desc = "Widget (Center Float)" })

        end,
        opts = { log = true }
    }
}
