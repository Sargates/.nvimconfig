return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = {
            italic = {
                strings = false,
                comments = false,
                operators = false
            }
        },
    },
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function ()
            vim.cmd.colorscheme("kanagawa")
            vim.o.background = "dark" -- or "light" for light mode
        end,
        opts = {
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,         -- do not set background color
            dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            -- overrides = function(colors) -- add/modify highlights
            --     return {}
            -- end,
            theme = "wave",              -- Load "wave" theme
            background = {               -- map the value of 'background' option to a theme
                dark = "wave",           -- try "dragon" !
                light = "lotus"
            },
        }
    }
}
