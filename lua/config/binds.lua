
-- Telescope binds
    local builtin = require("telescope.builtin")

    -- local telescope = require("telescope")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<space>fd", function() builtin.find_files { find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" } } end, { desc = "Telescope find all files" }) -- https://github.com/creativenull/dotfiles/blob/4fc5971029604ff1c338cfe0c6c2c333d9ee3ec4/.config/nvim-nightly/lua/creativenull/plugins/config/telescope.lua#L17
    vim.keymap.set("n", "<leader>fg", function ()
        require("telescope.builtin").live_grep {
            glob_pattern = "!.git"
        }
    end, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>tfb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")


-- Move current line up/down
    -- Normal mode mappings
    vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { noremap = true, silent = true })

    -- Insert mode mappings
    vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
    vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

    -- Visual mode mappings
    vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
    vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })


-- LSP Things

    local opts = { noremap=true, silent=true }
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.keymap.set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    vim.keymap.set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.keymap.set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.keymap.set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)


    -- Format Selection
    vim.keymap.set("v", "<Leader>1f", vim.lsp.buf.format, {
        -- opts = {
        --     -- tabSize = vim.opt.shiftwidth,
        --     -- insertSpaces = true,
        -- }
    })


    -- require("lspconfig").clangd.setup {
    --     on_attach = function(client, bufnr)
    --         client.server_capabilities.signatureHelpProvider = false
    --     end,
    -- }
    --
    -- -- Toggle Diagnostics (inline error reporting)
    -- vim.keymap.set("n", "<leader>td", function()
    --     vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    -- end, { silent = true, noremap = true })



-- -- CTRL+ENTER
--     vim.keymap.set({ "n", "i" }, "<C-CR>", "o<Esc>")
--     vim.keymap.set({ "n", "i" }, "<C-S-CR>", "O<Esc>")

-- Project


