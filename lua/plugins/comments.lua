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
        'Djancyp/better-comments.nvim',
        config = function()
            require('better-comment').Setup({
                tags = {
                    {
                        name = "TODO",
                        fg = "#ff8c00",
                        bg = "none",
                        bold = false,
                        virtual_text = "",
                    },
                    {
                        name = "!",
                        fg = "#ff2d00",
                        bg = "none",
                        bold = false,
                        virtual_text = "",
                    },
                    {
                        name = "?",
                        fg = "#3498db",
                        bg = "none",
                        bold = false,
                        virtual_text = "",
                    },
                    {
                        name = "//",
                        fg = "#474747",
                        bg = "none",
                        bold = false,
                        virtual_text = "",
                    },
                }
            })
            -- WARNING
        end,
    },
}
