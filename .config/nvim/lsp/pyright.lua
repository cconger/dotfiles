local root_markers = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
  '.git',
}


return {
  cmd = { 'pyright-langserver', '--stdio' },
  root_markers = root_markers,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        packageIndexDepths = {
          {
            name = "",
            depth = 3,
            includeAllSymbols = true,
          },
        },
        exclude = {
          -- Experimental only index stuff we've installed
          "**",
          "*",
          "**/*",
        },
      }
    }
  },
}
