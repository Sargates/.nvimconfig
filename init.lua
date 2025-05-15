require("config.lazy")

-- Make line numbers default
vim.wo.number = true

vim.o.mouse = 'v'

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true


-- local wk = require("which-key")
-- wk.add({
--         { "<C-CR>" }
--         -- { "<leader>f", group = "file" }, -- group
--         -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
--         -- { "<leader>fb", function() print("hello") end, desc = "Foobar" },
--         -- { "<leader>fn", desc = "New File" },
--         -- { "<leader>f1", hidden = true }, -- hide this keymap
--         -- { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
--         -- { "<leader>b", group = "buffers", expand = function()
--         --   return require("which-key.extras").expand.buf()
--         -- end
--         -- },
--         -- {
--         -- -- Nested mappings are allowed and can be added in any order
--         -- -- Most attributes can be inherited or overridden on any level
--         -- -- There's no limit to the depth of nesting
--         -- mode = { "n", "v" }, -- NORMAL and VISUAL mode
--         -- { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
--         -- { "<leader>w", "<cmd>w<cr>", desc = "Write" },
--     }
-- })

-- Telescope binds
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- Move current line up/down
    -- Normal mode mappings
    vim.keymap.set('n', '<C-j>', ":m .+1<CR>==", { noremap = true, silent = true })
    vim.keymap.set('n', '<C-k>', ":m .-2<CR>==", { noremap = true, silent = true })

    -- Insert mode mappings
    vim.keymap.set('i', '<C-j>', "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
    vim.keymap.set('i', '<C-k>', "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

    -- Visual mode mappings
    vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
    vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })




-- CTRL+ENTER
vim.keymap.set({ 'n', 'i' }, '<NL>', 'o<Esc>')
vim.keymap.set({ 'n', 'i' }, '<S-NL>', 'O<Esc>')

-- Project
vim.api.nvim_set_keymap(
    'n',
    '<C-p>',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)



