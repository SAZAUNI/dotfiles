require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"ts_ls",
		"html",
		"cssls",
		"jsonls",
		"bashls",
		"dockerls",
		"gopls",
		"rust_analyzer"
	},
	automatic_installation = true
})
