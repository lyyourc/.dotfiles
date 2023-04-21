local merge = function(a, b)
	local c = {}
	for k, v in pairs(a) do
		c[k] = v
	end
	for k, v in pairs(b) do
		c[k] = v
	end
	return c
end

return { {
	'neovim/nvim-lspconfig',
	dependencies = { -- Automatically install LSPs to stdpath for neovim
		{
			'williamboman/mason.nvim',
			build = ":MasonUpdate", -- :MasonUpdate updates registry contents
			opts = {}
		}, {
		'williamboman/mason-lspconfig.nvim',
		opts = {
			ensure_installed = { "gopls", "lua_ls", "golangci_lint_ls" }
		}
	} },
	config = function()
		-- Add additional capabilities supported by nvim-cmp
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		local default_config = {
			capabilities = capabilities
		}

		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		require('lspconfig')['gopls'].setup(default_config)
		require('lspconfig')['golangci_lint_ls'].setup(default_config)

		require('lspconfig')['lua_ls'].setup(merge(default_config, {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		}))

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = {
					buffer = ev.buf
				}

				vim.keymap.set('n', '<space>gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', '<space>gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', '<space>gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', '<space>gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', '<space>gh', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
				vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', '<space>dn', vim.diagnostic.open_float, opts)
			end
		})
	end
} }
