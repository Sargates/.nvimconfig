return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ':TSUpdate',
        config = function ()
            local ts = require('nvim-treesitter');
            ts.setup({
                install_dir = vim.fn.stdpath('data') .. '/site'
            })
            ts.install({"markdown", "bash", "zsh", "make", "lua", "c", "cpp", "rust", "latex"})

            --* Copied from nvim-treesitter github
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("tree-sitter-enable", { clear = true }),
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(args.match)
                    if not lang then return end

                    if vim.treesitter.query.get(lang, "highlights") then vim.treesitter.start(args.buf) end

                    if vim.treesitter.query.get(lang, "indents") then
                        vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
                    end

                    if vim.treesitter.query.get(lang, "folds") then
                        vim.opt_local.foldmethod = "expr"
                        vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    end
                end,

            })

            --* Copied from georgeharker/tree-sitter-zsh
            -- Relevant commands `:=vim.treesitter.language.get_filetypes("zsh")`
            --                   `:=vim.treesitter.query.get("zsh", "highlights")`
            vim.api.nvim_create_autocmd("User", {
                pattern = "TSUpdate",
                callback = function()
                    require("nvim-treesitter.parsers").zsh = {
                        install_info = {
                            url = "https://github.com/georgeharker/tree-sitter-zsh",
                            revision = "HEAD",
                            generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
                            queries = 'nvim-queries', -- also install queries from given directory
                        },
                        tier = 3,
                    }
                end,
            })



        end
    },
    {
        "MeanderingProgrammer/treesitter-modules.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<A-o>",
                    node_incremental = "<A-o>",
                    scope_incremental = "<A-O>",
                    node_decremental = "<A-i>",
                },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true

            -- Or, disable per filetype (add as you like)
            -- vim.g.no_python_maps = true
            -- vim.g.no_ruby_maps = true
            -- vim.g.no_rust_maps = true
            -- vim.g.no_go_maps = true
        end,
        config = function()
            require("nvim-treesitter-textobjects").setup {
                select = {
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    -- You can choose the select mode (default is charwise 'v')
                    --
                    -- Can also be a function which gets passed a table with the keys
                    -- * query_string: eg '@function.inner'
                    -- * method: eg 'v' or 'o'
                    -- and should return the mode ('v', 'V', or '<c-v>') or a table
                    -- mapping query_strings to modes.
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                        -- ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    -- If you set this to `true` (default is `false`) then any textobject is
                    -- extended to include preceding or succeeding whitespace. Succeeding
                    -- whitespace has priority in order to act similarly to eg the built-in
                    -- `ap`.
                    --
                    -- Can also be a function which gets passed a table with the keys
                    -- * query_string: eg '@function.inner'
                    -- * selection_mode: eg 'v'
                    -- and should return true of false
                    include_surrounding_whitespace = false,
                },
            }
            -- keymaps
            -- You can use the capture groups defined in `textobjects.scm`
            vim.keymap.set({ "x", "o" }, "af", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "if", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ac", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ic", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
            end)
            -- You can also use captures from other query groups like `locals.scm`
            vim.keymap.set({ "x", "o" }, "as", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
            end)
        end
    }
}
