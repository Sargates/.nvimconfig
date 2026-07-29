-- local opts = { noremap=true, silent=true }
local on_attach = function(client, bufnr)
    -- disable line wrapping
    vim.opt.textwidth = 0
end

local cmake_lsp_group = vim.api.nvim_create_augroup("Cmake LSP Group", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "CMakeLists.txt", "*.cmake" },
    callback = function()
        vim.print("Enabling CMake LSP");
        vim.lsp.enable("neocmake")
    end,
    group = cmake_lsp_group
})

vim.lsp.config("neocmake", {
    on_attach = on_attach,
    cmd = { "neocmakelsp", "stdio" },
    filetypes = { "cmake" },
    -- root_dir = function(fname)
    --     return nvim_lsp.util.find_git_ancestor(fname)
    -- end,
    single_file_support = true,-- suggested
    init_options = {
        format = {
            enable = false
        },
        lint = {
            enable = true,
            line_max_words = 90,
        },
        scan_cmake_in_package = true, -- default is true
    }
})

return {}
