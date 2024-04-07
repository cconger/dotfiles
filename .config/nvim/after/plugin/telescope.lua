require('telescope').setup{
  extensions = {
    file_browser = {
      hijack_netrw = true,
    }
  },
}

local builtin = require('telescope.builtin')

require('keymap').telescope_keys(builtin)
require("telescope").load_extension("file_browser")

