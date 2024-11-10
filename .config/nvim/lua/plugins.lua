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
  -- Telescope is slow?
--	'nvim-telescope/telescope.nvim',
--	{
--		'nvim-telescope/telescope-file-browser.nvim',
--		depedencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'},
--	},

  'junegunn/fzf',
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
  },

	'stevearc/oil.nvim',
	{
		'stevearc/oil.nvim',
    opts = {},
		depedencies = { 'nvim-tree/nvim-web-devicons' },
	},

	-- LSP
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',

	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',

	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- Style
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	'ellisonleao/gruvbox.nvim',

	-- Other
	'kylechui/nvim-surround',

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function() require("copilot_cmp").setup() end
	},
})
