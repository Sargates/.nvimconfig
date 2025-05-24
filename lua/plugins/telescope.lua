return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
		},
		-- opts = {
		-- 	defaults = {
		-- 		-- `--smartcase` is to disable case sensitivity
		-- 		-- `--color=never` is recommended by `:h telescope.defaults.vimgrep_arguments`
		-- 		-- See here for the rest: https://github.com/BurntSushi/ripgrep/issues/623#issuecomment-659909044
		-- 	},
		-- 	extensions = {
		-- 		-- file_browser = {
		-- 		-- 	grouped = true,
		-- 		-- 	theme = "gruvbox",
		-- 		-- 	-- disables netrw and use telescope-file-browser in its place
		-- 		-- 	hijack_netrw = true,
		-- 		-- 	mappings = {
		-- 		-- 		["i"] = {
		-- 		-- 			-- your custom insert mode mappings
		-- 		-- 		},
		-- 		-- 		["n"] = {
		-- 		-- 			-- your custom normal mode mappings
		-- 		-- 		},
		-- 		-- 	},
		-- 		-- }
		-- 	}
		-- },
		config = function()
			require("telescope").setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob",
						"!.git",
					}
				}
			})
			vim.keymap.set("n", "<space>en", function()
				require("telescope.builtin").find_files {
					cwd = vim.fn.stdpath("config")
				}
			end)
		end
	},
	-- {
	-- 	"nvim-telescope/telescope-file-browser.nvim",
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim"
	-- 	},
	-- 	config = function ()
	-- 		require("telescope").load_extension("file_browser")
	-- 	end
	-- },
	{
		"nvim-telescope/telescope-project.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function ()
			require("telescope").load_extension("project")
			vim.api.nvim_set_keymap(
				"n",
				"<C-p>",
				":lua require('telescope').extensions.project.project{}<CR>",
				{noremap = true, silent = true}
			)
		end
	},
}
