local opts = { noremap=true, silent=true }
local on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false

    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 's', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'i', ',s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',qf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "SmiteshP/nvim-navbuddy"
            -- "hrsh7th/cmp-nvim-lsp"
        },
        config = function()
            vim.lsp.config.bashls = {
                filetypes = { "sh", "bash", "zsh" },
                settings = {
                    bashIde = {
                        globPattern = "**/*@(.sh|.bash|.zsh)",
                    }
                }
            }
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
                ui = {
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                }
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

            -- shoutout jdh on youtube - https://github.com/jdah/dotfiles/blob/2b984059a68637640f03732569e24e317e7c9115/.config/nvim/lua/mylsp.lua
            vim.lsp.config("clangd", {
                on_attach = on_attach,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--pch-storage=memory",
                    "--all-scopes-completion",
                    "--pretty",
                    "--header-insertion=never",
                    "-j=4",
                    -- "--inlay-hints", -- removed. See https://github.com/clangd/clangd/discussions/986#discussioncomment-1949032
                    "--header-insertion-decorators",
                    -- "--function-arg-placeholders",
                    "--completion-style=detailed"
                }
            })

            vim.lsp.config("basedpyright", {
                on_attach = on_attach,
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "off"
                        }
                    }
                }
            })

            vim.lsp.config("luals", {
                on_attach = on_attach,
                cmd = { "lua-language-server" },
            })

            vim.lsp.config('zls', {
                on_attach = on_attach,
                cmd = {
                    'zls'
                },
            })

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
    --     "seblyng/roslyn.nvim",
    --     ft = "cs",
    --     -- ---@module 'roslyn.config'
    --     -- ---@type RoslynNvimConfig
    --     config = function()
    --         require("roslyn").setup {
    --             filewatching = "roslyn"
    --         }
    --         vim.lsp.config("roslyn", {
    --             on_attach = function() end,
    --             settings = {
    --                 ["csharp|inlay_hints"] = {
    --                     -- csharp_enable_inlay_hints_for_implicit_object_creation = true,
    --                     -- csharp_enable_inlay_hints_for_implicit_variable_types = true,
    --                     -- csharp_enable_inlay_hints_for_lambda_parameter_types = true,
    --                     -- csharp_enable_inlay_hints_for_types = true,
    --                     -- dotnet_enable_inlay_hints_for_indexer_parameters = true,
    --                     -- dotnet_enable_inlay_hints_for_literal_parameters = true,
    --                     -- dotnet_enable_inlay_hints_for_object_creation_parameters = true,
    --                     -- dotnet_enable_inlay_hints_for_other_parameters = true,
    --                     -- dotnet_enable_inlay_hints_for_parameters = true,
    --                     -- dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
    --                     -- dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
    --                     -- dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
    --                 },
    --                 ["csharp|code_lens"] = {
    --                     dotnet_enable_references_code_lens = true,
    --                 },
    --                 ["csharp|completion"] = {
    --                     dotnet_show_completion_items_from_unimported_namespaces = true,
    --                     dotnet_show_name_completion_suggestions = true,
    --                 },
    --             },
    --         })
    --     end
    -- },
    -- -- lspconfig.omnisharp.setup({
    -- --     enable_import_completion = true,
    -- --     enable_decompilation_support = true
    -- -- })

    {
        'nvimdev/lspsaga.nvim',
        opts = {},
        config = function()
            require'lspsaga'.setup({ ui = { code_action = "" } })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            -- 'nvim-tree/nvim-web-devicons',     -- optional
        }
    },
}
