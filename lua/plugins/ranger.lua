return {
    "kelly-lin/ranger.nvim",
    config = function()
        require("ranger-nvim").setup({
            replace_netrw = true,
            ui = {
                border = "none",
                width = 1,
                height = 0.95,
                x = 0.5,
                y = 0.5,
            },
            enable_cmds = false,
            keybinds = {},
        })
        vim.api.nvim_set_keymap("n", "<leader>ef", "", {
            noremap = true,
            callback = function()
                require("ranger-nvim").open(true)
            end,
        })
    end,
    -- opts = 
}
