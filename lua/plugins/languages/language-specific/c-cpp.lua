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
    -- vim.api.nvim_buf_set_keymap(bufnr, 'i', ',s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ',D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ',qf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ',f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    vim.opt.textwidth = 0
end

local clangd_lsp_group = vim.api.nvim_create_augroup("Clangd LSP Group", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "c", "cpp" },
    callback = function()
        vim.print("Starting Clangd");
        vim.lsp.enable("clangd")
    end,
    group = clangd_lsp_group
})

-- jdh on youtube - https://github.com/jdah/dotfiles/blob/2b984059a68637640f03732569e24e317e7c9115/.config/nvim/lua/mylsp.lua
vim.lsp.config("clangd", {
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--pch-storage=memory", -- This setting *will* hog a shit ton of memory if your PCH file is huge
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

return {}


