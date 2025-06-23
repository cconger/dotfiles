local m = {}

function m.get_open_buffer_paths()
  local bufs = vim.api.nvim_list_bufs()
  local paths = {}

  for _, buf in ipairs(bufs) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local name = vim.api.nvim_buf_get_name(buf)
      if name ~= "" then
        local rel = vim.fn.fnamemodify(name, ":.") -- ":." is relative to . (cwd)
        table.insert(paths, rel)
      end
    end
  end

  return paths
end

function m.copy_open_buffer_paths()
  local paths = m.get_open_buffer_paths()
  if vim.tbl_isempty(paths) then
    vim.notify("No open buffers to copy.", vim.log.levels.WARN)
    return
  end

  local path_str = table.concat(paths, "\n")
  vim.fn.setreg("+", path_str)
  vim.notify("Copied open buffer paths to clipboard", vim.log.levels.INFO)
end

m.fzf_keys = function(fzf)
  vim.keymap.set("n", "<leader>ff", function() fzf.oldfiles() end, {})
  vim.keymap.set("n", "<leader>fb", fzf.buffers, {})
  vim.keymap.set("n", "<leader>fp", function() fzf.files() end, {})
  vim.keymap.set("n", "<leader>fo", function()
    local cwd = vim.fn.expand("%:p:h")
    fzf.files({cwd = cwd})
  end, {})
  vim.keymap.set("n", "<leader>fg", function() fzf.grep_project() end, {})
  vim.keymap.set("n", "<leader>fG", function() fzf.grep_cWORD() end, {})
  vim.keymap.set("n", "<leader>fl", function() fzf.git_status() end, {})
end

m.dap_keys = function(dap, widgets)
  vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
  vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "Step Over" })
  vim.keymap.set("n", "<leader>dl", dap.step_over, { desc = "Step Into" })
  vim.keymap.set("n", "<leader>dh", dap.step_out, { desc = "Step Out" })
  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
  vim.keymap.set("n", "<leader>dB", dap.set_breakpoint, { desc = "Set Breakpoint" })
  vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open Debug REPL" })
  vim.keymap.set("n", "<leader>dk", widgets.hover, { desc = "Hover widget" })
  vim.keymap.set("n", "<leader>dp", widgets.preview, { desc = "Hover preview" })
  vim.keymap.set("n", "<leader>df", function() widgets.centered_float(widgets.frames) end, { desc = "Debug Frames" })
end

m.setup = function()
  vim.keymap.set("n", "<space>", '', {})
  vim.keymap.set('n', "<leader>y", '"*y')
  vim.keymap.set('v', "<leader>y", '"*y')
  vim.keymap.set('n', "<leader>p", '"*p')
  vim.g.mapleader = ' '

  vim.keymap.set('n', '<leader>o', ':e %:h<CR>')

  vim.keymap.set("n", "<leader>fy", function()
    local filename = vim.fn.expand("%")
    vim.fn.setreg("*", filename)
    vim.notify("Copied file name: " .. filename, vim.log.levels.INFO)
  end, { desc = "Copy the file name to the clipboard" })
  vim.keymap.set("n", "<leader>fc", m.copy_open_buffer_paths)

  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
  vim.keymap.set("n", 'K', vim.lsp.buf.hover)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
  vim.keymap.set("n", "gr", vim.lsp.buf.references)
  vim.keymap.set("n", "<leader>lv", vim.diagnostic.open_float)
  vim.keymap.set("n", "<leader>li", function() vim.cmd("checkhealth lsp") end)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
  vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.jump({ count = 1, float = true }) end)
  vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.jump({ count = -1, float = true }) end)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help)
  vim.keymap.set("n", "<leader>lt", vim.lsp.buf.typehierarchy)
  vim.keymap.set("n", "<leader>lc", vim.lsp.buf.incoming_calls)
  vim.keymap.set("n", "<leader>lC", vim.lsp.buf.outgoing_calls)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)


end

return m

