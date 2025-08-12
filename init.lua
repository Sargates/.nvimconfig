-- Required for zsh treesitter support
vim.treesitter.language.register("bash", "zsh")


-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

require("config.lazy")

-- Make line numbers default
vim.wo.number = true

vim.o.mouse = "v"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

require("config.binds")

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- LSP Diagnostics
vim.diagnostic.config({
    -- virtual_text = {
    --     prefix = "□",
    --     space = 4,
    --     source = "if_many",
    --     virt_text_pos = "eol",
    --     format = function(diagnostic)
    --         if diagnostic.severity == vim.diagnostic.severity.ERROR then
    --             return string.format("E: %s", diagnostic.message)
    --         end
    --         return diagnostic.message
    --     end
    -- },
    -- virtual_text = true,
    virtual_lines = true,
})

-- From TJ's tree-sitter video - https://www.youtube.com/watch?v=MpnjYb-t12A
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = '',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


-- -- Vim-Plug
-- vim.cmd([[
-- call plug#begin()
-- " List your plugins here
-- Plug "jbgutierrez/vim-better-comments"
-- Plug "mg979/vim-visual-multi", {"branch": "master"}
-- call plug#end()
-- ]])

-- TODO Source better comments
-- vim.cmd("source " .. vim.fn.stdpath("config") .. "/vimscript/better-comments.vim")
-- vim.cmd("source " .. vim.fn.stdpath("config") .. "/vimscript/visual-multicursor.vim")

-- require("config.better-comments")

