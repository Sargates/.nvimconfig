return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "SmiteshP/nvim-navbuddy"
            -- "hrsh7th/cmp-nvim-lsp"
        },
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require('mason').setup {}
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        config = function()
            require('mason-lspconfig').setup {}
            -- require("lspconfig").clangd.setup({
            --     on_attach = function(client, bufnr)
            --         require("nvim-navbuddy").attach(client, bufnr)
            --     end
            -- })
            -- require('lspconfig').ccls.setup { -- don't even know if this is necessary. code actions with clang are kind of shit, but having two LSP servers at the same time is annoying to manage.
                -- codeAction = {
                --     codeActionLiteralSupport = {
                --         codeActionKind = {
                --             valueSet = { "", "quickfix", "refactor", "refactor.extract", "refactor.inline", "refactor.rewrite", "source", "source.organizeImports" }
                --         }
                --     },
                --     dataSupport = true,
                --     dynamicRegistration = true,
                --     isPreferredSupport = true,
                --     resolveSupport = {
                --         properties = { "edit", "command" }
                --     }
                -- },
            -- }
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } }
            }
        }
    },
    -- {
    --     "SmiteshP/nvim-navbuddy",
    --     dependencies = {
    --         "SmiteshP/nvim-navic",
    --         "MunifTanjim/nui.nvim"
    --     },
    --     opts = { lsp = { auto_attach = true } }
    -- }
}
