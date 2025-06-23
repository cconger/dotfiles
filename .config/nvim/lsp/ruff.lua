return {
  cmd = { "ruff", "server" },
  root_markers = {
    --"pyproject.toml",
    ".git",
    -- "ruff.toml",
    --" .ruff.toml"
  },
  filetypes = { "python" },
  settings = {},
}

