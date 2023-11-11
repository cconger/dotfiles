local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Utlities
	'wbthomason/packer.nvim',
	'nvim-lua/plenary.nvim',

	-- Navigation
	'preservim/nerdtree',
	'nvim-telescope/telescope.nvim',

	-- LSP
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-vsnip',
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*",
		-- install jsregexp (optional!:).
		build = "make install_jsregexp"
	},
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',

	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- Style
	'ellisonleao/gruvbox.nvim',
	'itchyny/lightline.vim',

	-- Other
	'kylechui/nvim-surround',

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function() require("copilot_cmp").setup() end
	},
})
