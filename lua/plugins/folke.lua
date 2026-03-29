return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile      = { enabled = false },
            dashboard    = { enabled = false },
            explorer     = { enabled = false },
            indent       = { enabled = false },
            input        = { enabled = false },
            picker       = { enabled = false },
            notifier     = { enabled = true },
            quickfile    = { enabled = false },
            scope        = { enabled = false },
            scroll       = { enabled = false },
            statuscolumn = { enabled = false },
            words        = { enabled = false },
        },
    },
    {
        "folke/which-key.nvim",
        lazy = false,
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    }
}
