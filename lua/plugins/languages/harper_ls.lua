local on_attach = function(client, bufnr)
    -- disable line wrapping
    vim.opt.textwidth = 0
end

vim.lsp.config("harper_ls", {
    on_attach = on_attach,
    filetypes = {
        'asciidoc',
        'gitcommit',
        'markdown',
        'tex',
    },
    settings = {
        ["harper-ls"] = {
            userDictPath = "",
            workspaceDictPath = "",
            fileDictPath = "",
            linters = {
                -- SpellCheck = true,
                AvoidCurses = false, -- fuck you, harper
                -- SpelledNumbers = false,
                -- AnA = true,
                -- SentenceCapitalization = true,
                -- UnclosedQuotes = true,
                -- WrongApostrophe = false,
                -- LongSentences = true,
                -- RepeatedWords = true,
                -- Spaces = true,
                -- CorrectNumberSuffix = true
            },
            codeActions = {
                ForceStable = false
            },
            markdown = {
                IgnoreLinkTitle = false
            },
            diagnosticSeverity = "hint",
            isolateEnglish = false,
            dialect = "American",
            maxFileLength = 120000,
            ignoredLintsPath = "",
            excludePatterns = {}
        }
    }
})

-- 

return {}
