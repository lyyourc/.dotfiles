-- usage:
-- :lua vim.lsp.buf.formatting()
local formatting = require("null-ls").builtins.formatting
-- local completion = require("null-ls").builtins.completion

require("null-ls").setup({
    sources = {
		formatting.prettier,
		formatting.gofumpt,
		formatting.goimports,
        -- completion.spell,
    },
})

