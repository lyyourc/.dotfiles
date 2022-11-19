-- Automatically install packer
-- optional, or you must install packer manually
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.cmd [[packadd packer.nvim]]
end


-- Automatically run :PackerCompile
-- optional or You must run this or `PackerSync` whenever you make changes to your plugin configuration
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- My plugins here
	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- file explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		}
	}

	-- LSP
	use {
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim"
		}
	}
	-- format & lint
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	-- auto complete
	use({ 'hrsh7th/nvim-cmp' }) -- Autocompletion plugin
	use({ 'hrsh7th/cmp-nvim-lsp' }) -- LSP source for nvim-cmp
	use({ 'hrsh7th/cmp-buffer' }) -- buffer source
	use({ 'hrsh7th/cmp-path' }) -- path source

	use({ 'saadparwaiz1/cmp_luasnip' }) -- Snippets source for nvim-cmp
	use({ 'L3MON4D3/LuaSnip' }) -- Snippets plugin
	use({ 'rafamadriz/friendly-snippets' })

	--terminal
	use({ 'akinsho/toggleterm.nvim' })
	-- session
	use({ 'rmagatti/auto-session' })

	-- color schema
	use({ 'EdenEast/nightfox.nvim' })

	-- syntax highlight
	use({
		'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	})
	use({
		'nvim-treesitter/nvim-treesitter-textobjects',
	})

	-- git
	use({ 'lewis6991/gitsigns.nvim' })

	-- commnet
	use({ 'numToStr/Comment.nvim' })
	-- autopaires
	use({ 'windwp/nvim-autopairs' })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	-- optional
	if packer_bootstrap then
		require('packer').sync()
	end
end)
