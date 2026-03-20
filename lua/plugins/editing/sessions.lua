return {
    {
        "folke/persistence.nvim",
        -- event = "BufReadPre", -- this will only start session saving when an actual file was opened
        config = function()
            require("persistence").setup()
            -- load the session for the current directory
            vim.keymap.set("n",
                "<leader>qs",
                function() require("persistence").load() end,
                { desc = "Load last session (in CWD)" }
            )

            -- select a session to load
            vim.keymap.set("n",
                "<leader>qS",
                function() require("persistence").select() end,
                { desc = "Select session" }
            )

            -- -- load the last session
            vim.keymap.set("n",
                "<leader>ql",
                function() require("persistence").load({ last = true }) end,
                { desc = "Load last session (Absolute)" }
            )

            -- stop Persistence => session won't be saved on exit
            vim.keymap.set("n",
                "<leader>qd",
                function() require("persistence").stop() end,
                { desc = "Kill persistence (Don't save session on quit)" }
            )
        end
    },
    {
        "AndrewRadev/undoquit.vim",
        config = function() end
    },
    {
        "chrisbra/recover.vim"
    }
}
