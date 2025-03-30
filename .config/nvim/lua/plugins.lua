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
  -- Utilities
  'nvim-lua/plenary.nvim',

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = '/usr/local/bin/node',
      copilot_model = 'gpt-4o-copilot',
    },
  },

  -- Navigation
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local fzf = require('fzf-lua')
      fzf.setup({ 'fzf-vim' })
      require('keymap').fzf_keys(fzf)
    end
  },
  'stevearc/oil.nvim',
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- LSP
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup(
        {
          sources = {
            -- null_ls.builtins.code_actions.gitsigns,
            null_ls.builtins.diagnostics.codespell,
            -- null_ls.builtins.diagnostics.mypy,
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.prettierd,
          }
        }
      )
    end
  },

  -- Completion
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      keymap = {
        preset = 'default',
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'accept', 'fallback' },
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = {
          'lsp',
          'path',
          'copilot',
        },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            async = true,
          },
        },
      },
    },
  },

  'williamboman/mason.nvim',

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Style
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  'ellisonleao/gruvbox.nvim',

  -- Other
  'kylechui/nvim-surround',
})
