-- vim.g.bettercomments_language_aliases = { zsh = "sh" }
-- vim.g.bettercomments_included = { "zsh" }


require("config.lazy")

-- Make line numbers default
vim.wo.number = true

vim.o.mouse = "v"

vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd.colorscheme("gruvbox")
vim.cmd.colorscheme("kanagawa")
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

require("config.binds")


-- require("vscode-multi-cursor").setup({
--     default_mappings = true,
--     no_selection = false,
-- })

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

