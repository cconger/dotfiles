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
  use 'hrsh7th/cmp-vsnip'
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v<CurrentMajor>.*",
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Style
	use 'ellisonleao/gruvbox.nvim'
  use 'itchyny/lightline.vim'

	-- Other
  use 'kylechui/nvim-surround'

  -- Copilot
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end
  }
  use { "zbirenbaum/copilot-cmp", after = "copilot.lua", config = function() require("copilot_cmp").setup() end }
end)
