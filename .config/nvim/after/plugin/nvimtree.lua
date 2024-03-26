local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5 

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }   
  end

  api.config.mappings.default_on_attach(bufnr)
end


require("nvim-tree").setup({
  on_attach = on_attach,
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})

