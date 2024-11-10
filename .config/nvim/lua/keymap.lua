local m = {}

-- LSP on_attach
m.lsp_keys = function(client, bufnr)
	opts = { noremap=true, silent=true, buffer=bufnr }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>lv", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>li", function() vim.cmd("LspInfo") end, opts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next({buffer=bufnr}) end, opts)
	vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev({buffer=bufnr}) end, opts)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, opts)

  -- Use Telescope 
  -- Disabled because I don't use telescope anymore
	--local builtin = require('telescope.builtin')
	--vim.keymap.set("n", "<leader>lc", builtin.lsp_incoming_calls, {})
	--vim.keymap.set("n", "<leader>lC", builtin.lsp_incoming_calls, {})
	--vim.keymap.set("n", "<leader>ld", builtin.diagnostics, opts)
	--vim.keymap.set('n', '<leader>lr', builtin.references, opts)
end


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

m.setup = function()
	vim.keymap.set("n", "<space>", '', {})
  vim.keymap.set('n', "<leader>y", '"*y')
  vim.keymap.set('v', "<leader>y", '"*y')
  vim.keymap.set('n', "<leader>p", '"*p')
	vim.g.mapleader = ' '

  vim.keymap.set('n', '<leader>o', ':e %:h<CR>')

  vim.keymap.set("n", "<leader>ff", ":History<CR>", {})
  vim.keymap.set("n", "<leader>fp", ":Files<CR>", {})
  vim.keymap.set("n", "<leader>fo", ":Files %:p:h<CR>", {})
  vim.keymap.set("n", "<leader>fg", ":Rg<CR>", {})
  vim.keymap.set("n", "<leader>fl", ":GFiles<CR>", {})
end

return m

