return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    -- {
    --     'adelarsq/image_preview.nvim',
    --     event = 'VeryLazy',
    --     config = function()
    --         require("image_preview").setup()
    --     end
    -- },

    -- {
    --     "lervag/vimtex",
    --     lazy = false,     -- we don't want to lazy load VimTeX
    --     -- tag = "v2.15", -- uncomment to pin to a specific release
    --     init = function()
    --         -- VimTeX configuration goes here, e.g.
    --         vim.g.vimtex_view_method = "xreader"
    --     end
    -- }

    -- { -- didn't end up needing this
    --     'tigion/nvim-asciidoc-preview',
    --     ft = { 'asciidoc' },
    --     build = 'cd server && npm install --omit=dev',
    --     ---@module 'asciidoc-preview'
    --     ---@type asciidoc-preview.Config
    --     opts = {
    --         -- Add user configuration here
    --     },
    -- }
}
