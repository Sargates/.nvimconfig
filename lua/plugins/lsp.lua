return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "SmiteshP/nvim-navbuddy"
            -- "hrsh7th/cmp-nvim-lsp"
        },
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.bashls.setup({
                filetypes = { "sh", "bash", "zsh" },
                settings = {
                    bashIde = {
                        globPattern = "**/*@(.sh|.bash|.zsh)",
                    }
                }
            })
            -- lspconfig.omnisharp.setup({
            --     enable_import_completion = true,
            --     enable_decompilation_support = true
            -- })
        end
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require('mason').setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        config = function()
            require('mason-lspconfig').setup {
                ensure_installed = {
                    "bashls"
                    -- "ast-grep",
                    -- "rust-analyzer",
                    -- "asm-lsp",
                    -- "bash-language-server",
                    -- "clangd",
                    -- "jq",
                    -- "ts_ls"
                },
                automatic_enable = true
            }
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
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        ---@module 'roslyn.config'
        ---@type RoslynNvimConfig
        config = function()
            require("roslyn").setup {
                filewatching = "roslyn"
            }

            vim.lsp.config("roslyn", {
                on_attach = function() end,
                settings = {
                    ["csharp|inlay_hints"] = {
                        -- csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        -- csharp_enable_inlay_hints_for_implicit_variable_types = true,
                        -- csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                        -- csharp_enable_inlay_hints_for_types = true,
                        -- dotnet_enable_inlay_hints_for_indexer_parameters = true,
                        -- dotnet_enable_inlay_hints_for_literal_parameters = true,
                        -- dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                        -- dotnet_enable_inlay_hints_for_other_parameters = true,
                        -- dotnet_enable_inlay_hints_for_parameters = true,
                        -- dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                        -- dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                        -- dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                    },
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = true,
                    },
                    ["csharp|completion"] = {
                        dotnet_show_completion_items_from_unimported_namespaces = true,
                        dotnet_show_name_completion_suggestions = true,
                    },
                },
            })
        end
    }
    -- {
    --     "SmiteshP/nvim-navbuddy",
    --     dependencies = {
    --         "SmiteshP/nvim-navic",
    --         "MunifTanjim/nui.nvim"
    --     },
    --     opts = { lsp = { auto_attach = true } }
    -- }
}
