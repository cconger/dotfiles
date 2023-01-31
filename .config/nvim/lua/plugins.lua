vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Utlities
	use 'wbthomason/packer.nvim'
        use 'nvim-lua/plenary.nvim'

	-- Navigation
        use 'preservim/nerdtree'
        use 'nvim-telescope/telescope.nvim'

	-- LSP
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'

        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Style
	use 'ellisonleao/gruvbox.nvim'
        use 'itchyny/lightline.vim'

	-- Other
        use 'kylechui/nvim-surround'
end)
