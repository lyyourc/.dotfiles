-- :h mason-settings
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"gopls"
	}
})

