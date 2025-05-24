return {
    {
        'numToStr/Comment.nvim',
        opts = {
            padding = true,
            -- toggler = { line = {'gcc', '^C'}, block = 'gbc' },
            -- add any options here
        }
    },

    {
        "jbgutierrez/vim-better-comments",
        branch = "master",
        config = function() end,
        -- event = "User AstroFile",
    }
}
