-- Make gopls understand bazel
-- local f=io.open("./tools/bazel/gopackagesdriver.sh","r")
-- if f~=nil then
--   io.close(f)
--   dir = vim.fn.getcwd()
--   vim.fn.setenv("GOPACKAGESDRIVER", dir .. "/tools/bazel/gopackagesdriver.sh")
-- else
--   vim.fn.setenv("GOPACKAGESDRIVER", "")
-- end
--

return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  settings = {
    cmd_env = {
    },
    gopls = {
      verboseOutput = true,
      directoryFilters = {
        "-bazel-bin",
        "-bazel-out",
        "-bazel-testlogs",
      },
      gofumpt = true,
      usePlaceholders = true,
      semanticTokens = true,
      codelenses = {
        gc_details = false,
        regenerate_cgo = false,
        generate = false,
        test = false,
        tidy = false,
        upgrade_dependency = false,
        vendor = false
      },
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
