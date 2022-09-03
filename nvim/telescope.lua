function KB(mode, keyStroke, action, opts)
	vim.api.nvim_set_keymap(mode, keyStroke, action, opts or { noremap = true })
end

local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

KB("n", "<leader>t", "<cmd>lua require('telescope.builtin').git_files()<cr>")
KB("n", "<C-p>p", "<cmd>lua require('telescope.builtin').find_files()<cr>")
KB("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
KB("n", "<C-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>")
KB("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

telescope.setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		path_display = { "truncate" },
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = actions.which_key,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

telescope.load_extension("fzf")
