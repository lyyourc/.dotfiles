local keymap = function(mode, key, result)
	vim.api.nvim_set_keymap(
		mode,
		key,
		result,
		{ noremap = true, silent = true }
	)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--

-- fuzzy finder
keymap("n", "<leader><space>", ":Telescope <cr>")
keymap("n", "<leader>ff", ":Telescope find_files<cr>")
keymap("n", "<leader>fg", ":Telescope live_grep<cr>")
keymap("n", "<leader>fb", ":Telescope buffers<cr>")
keymap("n", "<leader>fp", ":Telescope oldfiles<cr>")
keymap("n", "<leader>fo", ":Telescope lsp_document_symbols<cr>")
keymap("n", "<leader>fd", ":Telescope diagnostics<cr>")
-- open back your last telescope to its previous state
keymap("n", "<leader>fr", ":Telescope resume<cr>")

-- lsp
keymap("n", "gr", ":Telescope lsp_references<cr>")
keymap("n", "gi", ":Telescope lsp_implementations<cr>")
keymap("n", "gd", ":Telescope lsp_definitions<cr>")
keymap("n", "gD", ":Telescope lsp_type_definitions<cr>")

-- file explorer
keymap("n", "<leader>et", ":NvimTreeToggle<cr>")
keymap("n", "<leader>ef", ":NvimTreeFocus<cr>")

-- format
keymap("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<cr>")
