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
end

-- Telescope
m.telescope_keys = function(ts)
	vim.keymap.set('n', '<C-p>', ts.find_files, {})
	vim.keymap.set('n', '<leader>ff', ts.find_files, {})
	vim.keymap.set('n', '<leader>fl', ts.git_files, {})
	vim.keymap.set('n', '<leader>fg', ts.live_grep, {})
	vim.keymap.set('n', '<leader>ft', ts.grep_string, {})
end

m.setup = function()
	vim.keymap.set("n", "<space>", '', {})
	vim.g.mapleader = ' '
end

return m

