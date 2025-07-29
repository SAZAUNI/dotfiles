require("lspconfig")

-- keymaps for nvim-lspconfig
vim.keymap.set("n", "ge", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename all references" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go Declaration" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

vim.diagnostic.config({ virtual_text = true, severity_sort = true, float = { border = "rounded", source = true } })
