return { {
	"zbirenbaum/copilot.lua",
	dependencies = {
		{
			"zbirenbaum/copilot-cmp",
			opts = {}
		},
	},
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
} }

