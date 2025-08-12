return {
    {
        'numToStr/Comment.nvim',
        opts = {
            padding = true,
            -- toggler = { line = {'gcc', '^C'}, block = 'gbc' },
            -- add any options here
        }
    },
    -- {
        -- // sigma
    --     "jbgutierrez/vim-better-comments",
    --     branch = "master",
    --     config = function() end,
    --     -- event = "User AstroFile",
    -- },
    {
        'Sargates/better-comments.nvim',
        opts = {
            tags = {
                {
                    name = "TODO",
                    fg = "#ff8c00",
                    bg = "none",
                    bold = false,
                },
                {
                    name = "!",
                    fg = "#ff2d00",
                    bg = "none",
                    bold = false,
                },
                {
                    name = "?",
                    fg = "#3498db",
                    bg = "none",
                    bold = false,
                },
                {
                    name = "//",
                    fg = "#474747",
                    bg = "none",
                    bold = false,
                },
                {
                    name = "WARN",
                    fg = "#FFA500",
                    bold = false,
                }
            }
        }
    },
}
