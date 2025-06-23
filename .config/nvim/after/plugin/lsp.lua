local config = {
  virtual_text = {
    current_line = true,
  }, -- disable virtual text
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "⚠︎",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    }
  },
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.enable({
  "buf-language-server",
  "gopls",
  "lua-language-server",
  "pyright",
  "ruff",
  "rust-analyzer",
  "terraform-ls",
  "tilt",
  "typescript-language-server",
  -- TODO: Create their configs and re-enable
  -- "zls",
})
