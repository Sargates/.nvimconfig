return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        config = function()
            -- function to fix telescope's fuckass bindings not working. See https://www.reddit.com/r/neovim/comments/1f7nkbe/open_multiple_files_with_telescope/

            ---Telescope action helper to open single or multiple files
            ---@param bufnr integer Telescope prompt buffer number
            function telescope_open_single_or_multi(bufnr)
              local actions = require("telescope.actions")
              local actions_state = require("telescope.actions.state")
              local single_selection = actions_state.get_selected_entry()
              local multi_selection = actions_state.get_current_picker(bufnr):get_multi_selection()
              if not vim.tbl_isempty(multi_selection) then
                actions.close(bufnr)
                for _, file in pairs(multi_selection) do
                  if file.path ~= nil then
                    vim.cmd(string.format("edit %s", file.path))
                  end
                end
                vim.cmd(string.format("edit %s", single_selection.path))
              else
                actions.select_default(bufnr)
              end
            end
            require("telescope").setup({
                pickers = {
                    find_files = {
                        follow = true
                    },
                    live_grep = {
                        follow = true
                    }
                },
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob",
                        "!.git",
                    },
                    mappings = {
                        ["i"] = {
                            ["<CR>"] = telescope_open_single_or_multi,
                        }
                    },
                    extensions = {
                        frecency = {
                          auto_validate = false,
                          matcher = "fuzzy",
                          path_display = { "filename_first" },
                        },
                    }
                }
            })
            vim.keymap.set("n", "<space>en", function()
                require("telescope.builtin").find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end)
        end
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        version = "*", -- install the latest stable version
        opts = {},
        config = function()
            require("telescope").load_extension("frecency")
            require("frecency.config").setup {
                workspace_scan_cmd = { "rg", "-.g", "!.git", "-L", "--files" }, -- default rg command doesn't include symlinks. downside is you must have ripgrep installed; no fallback logic
                hidden = true,
                ignore_patterns = { "*/.git", "*/.git/*", "*/.DS_Store" },
            }
        end,
    },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function ()
            require("telescope").load_extension("project")
            vim.api.nvim_set_keymap(
                "n",
                "<C-p>",
                ":lua require('telescope').extensions.project.project{}<CR>",
                {noremap = true, silent = true}
            )
        end
    },
}
