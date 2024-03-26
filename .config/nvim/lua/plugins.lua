vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
	'nvim-telescope/telescope.nvim',

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
