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
      panel = {
        enabled = true,
      },
      -- copilot_node_command = '/usr/local/bin/node',
      -- copilot_model = 'gpt-4.1',
    },
  },

  -- CodeCompanion
  {
    "olimorris/codecompanion.nvim",
    opts = {
      strategies = {
        chat = {
          adapter = "openai",
        },
        inline = {
          adapter = "openai",
        }
      },
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {})
        end,
      },
      opts = {
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
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
        per_filetype = {
          codecompanion = { "codecompanion" },
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

  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')

      vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

      dap.adapters.python = function(cb, config)
        if config.request == 'attach' then
          ---@diagnostic disable-next-line: undefined-field
          local port = (config.connect or config).port
          ---@diagnostic disable-next-line: undefined-field
          local host = (config.connect or config).host or '127.0.0.1'
          cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
              source_filetype = 'python',
            },
          })

        else
          cb({
            type = 'executable',
            command = '/Users/cconger/.virtualenvs/openai/bin/python',
            args = { '-m', 'debugpy.adapter' },
            options = {
              source_filetype = 'python',
            },
          })
        end
      end

      dap.configurations.python = {
        {
          type = 'python';
          request = 'launch';
          name = "Launch file";

          program = "${file}"; -- This configuration will launch the current file if used.
          pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
              return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
              return cwd .. '/.venv/bin/python'
            else
              return '/Users/cconger/.virtualenvs/openai/bin/python'
            end
          end;
        },
        {  -- Attach to debugpy on port 8100
          name    = 'Attach to localhost:8100',
          type    = 'python',
          request = 'attach',
          connect = { host = '127.0.0.1', port = 8100 },
          justMyCode = false,
        },
        {  -- Attach to debugpy on port 8181
          name    = 'Attach to localhost:8181',
          type    = 'python',
          request = 'attach',
          connect = { host = '127.0.0.1', port = 8181 },
          justMyCode = false,
        },
      }
      require("keymap").dap_keys(dap, require("dap.ui.widgets"))
    end
  },
})
