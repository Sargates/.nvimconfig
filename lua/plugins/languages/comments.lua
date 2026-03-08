return {
    {
        "numToStr/Comment.nvim",
        opts = {
            padding = true,
            -- toggler = { line = {'gcc', '^C'}, block = 'gbc' },
            -- add any options here
        }
    },
    {
        "Sargates/better-comments.nvim",
        -- dir = "/home/nick/dev/CS-Stuff/repos/forks/better-comments",
        config = function()
            require("better-comments").setup {
                tags = {
                    { name = "TODO",
                      fg = "#ff8c00",
                      underline = true },
                    { name = "!",
                      fg = "#ff2d00" },
                    { name = "?",
                      fg = "#3498db" },
                    { name = "#",
                      fg = "#60f76d" },
                    { name = "*",
                      fg = "#FFED29" },
                    { name = "//",
                      fg = "#474747" },
                    { name = "WARN",
                      fg = "#FFA500" }
                },
            }
        end,
    },
}
