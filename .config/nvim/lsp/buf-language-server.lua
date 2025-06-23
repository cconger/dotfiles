return {
  -- Beta buf language server
  cmd = { "buf", "beta", "lsp", "--timeout=0", "--log-format=text" },
  -- cmd = { "bufls", "serve" },
  filetypes = { "proto" },
  root_markers = { "buf.yaml", "buf.yml", "buf.work.yaml", ".git" },
}
