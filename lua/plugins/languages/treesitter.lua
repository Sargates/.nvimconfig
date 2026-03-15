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
            -- put your config here
        end,
    }
}
