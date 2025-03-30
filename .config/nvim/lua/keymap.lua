local m = {}

-- Telescope
m.telescope_keys = function(ts)
	vim.keymap.set('n', '<C-p>', ts.find_files, {})
	vim.keymap.set('n', '<leader>fp', ts.find_files, {})
	vim.keymap.set('n', '<leader>ff', ts.oldfiles, {})
	vim.keymap.set('n', '<leader>fl', ts.git_files, {})
	vim.keymap.set('n', '<leader>fg', ts.live_grep, {})
	vim.keymap.set('n', '<leader>ft', ts.grep_string, {})

  vim.keymap.set("n", "<leader>fo", ":Telescope file_browser<CR>")
  vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

  vim.keymap.set("n", "<leader>gg", ts.git_status, {})
end

m.fzf_keys = function(fzf)
  vim.keymap.set("n", "<leader>ff", function() fzf.oldfiles() end, {})
  vim.keymap.set("n", "<leader>fp", function() fzf.files() end, {})
  vim.keymap.set("n", "<leader>fo", function() 
    cwd = vim.fn.expand("%:p:h")
    fzf.files({cwd = cwd})
  end, {})
  vim.keymap.set("n", "<leader>fg", function() fzf.grep_project() end, {})
  vim.keymap.set("n", "<leader>fG", function() fzf.grep_cWORD() end, {})
  vim.keymap.set("n", "<leader>fl", function() fzf.git_status() end, {})
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

	vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
	vim.keymap.set("n", 'K', vim.lsp.buf.hover)
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
	vim.keymap.set("n", "gr", vim.lsp.buf.references)
	vim.keymap.set("n", "<leader>lv", vim.diagnostic.open_float)
	vim.keymap.set("n", "<leader>li", function() vim.cmd("checkhealth lsp") end)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
	vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
	vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help)
	vim.keymap.set("n", "<leader>lt", vim.lsp.buf.typehierarchy)
	vim.keymap.set("n", "<leader>lc", vim.lsp.buf.incoming_calls)
	vim.keymap.set("n", "<leader>lC", vim.lsp.buf.outgoing_calls)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
end

return m

