require("lspconfig")

-- keymaps for nvim-lspconfig
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
