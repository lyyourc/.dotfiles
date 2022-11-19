-- :help options
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- tab
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation

-- line number
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines


-- https://github.com/nvim-treesitter/nvim-treesitter#folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
-- vim.opt.foldenable = false -- Disable folding at startup.
