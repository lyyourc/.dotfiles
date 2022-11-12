-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp/

local cmp = require('cmp')
local luasnip = require('luasnip')

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = "buffer" },
		{ name = "path" },
	},
	-- REQUIRED - you must specify a snippet engine
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),

		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),

		["<C-Space>"] = cmp.mapping.complete(),


		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),

		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- Press <tab> to trigger
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

