return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
		require('telescope').setup {
			defaults = {
				vimgrep_arugments = '--smartcase'
			},
			extensions = {
				file_browser = {
					grouped = true,
					theme = "gruvbox",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						["i"] = {
							-- your custom insert mode mappings
						},
						["n"] = {
							-- your custom normal mode mappings
						},
					},
				}
			}
			-- pickers = {
			-- 	find_files = {
			-- 		hidden = true
			-- 	}
			-- }
		}
		vim.keymap.set("n", "<space>fd",
			function()                        -- https://github.com/creativenull/dotfiles/blob/4fc5971029604ff1c338cfe0c6c2c333d9ee3ec4/.config/nvim-nightly/lua/creativenull/plugins/config/telescope.lua#L17
				require("telescope.builtin").find_files {
					find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }
				}
			end)
		vim.keymap.set("n", "<space>en", function()
			require('telescope.builtin').find_files {
				cwd = vim.fn.stdpath("config")
			}
		end)
	end
}
