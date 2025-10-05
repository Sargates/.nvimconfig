return {
    -- lazy.nvim
    {
        "Sargates/url-open.nvim",
        event = "VeryLazy",
        cmd = "URLOpenUnderCursor",
        config = function()
            local status_ok, url_open = pcall(require, "url-open")
            if not status_ok then
                return
            end
            url_open.setup ({
                open_app = tonumber(os.getenv("ISWSL"))==1 and "wslview" or "xdg-open",
                open_only_when_cursor_on_url = true,
                highlight_url = {
                    all_urls = {
                        enabled = false
                    },
                    cursor_move = {
                        enabled = false
                    }
                }
            })
            vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>")
        end,
        -- opts = 
    },
}
