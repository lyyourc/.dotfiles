
local merge = function(a, b)
    local c = {}
    for k,v in pairs(a) do c[k] = v end
    for k,v in pairs(b) do c[k] = v end
    return c
end

local on_attach = function(client, bufnr)
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', '<space>gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', '<space>gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', '<space>gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<space>gh', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<space>dn', vim.diagnostic.open_float, bufopts)

end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local default_config = {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require('lspconfig')['gopls'].setup(default_config)

require('lspconfig')['sumneko_lua'].setup(merge(default_config, {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}))


require('lspconfig')['tsserver'].setup(default_config)
require('lspconfig')['volar'].setup(merge(default_config, {
	-- cmd = { "vue-language-server", "--stdio" }
}))

