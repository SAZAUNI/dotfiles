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
		"rust_analyzer",
		"jdtls",
	},
	automatic_installation = true
})

require("mason-nvim-dap").setup({
  ensure_installed = { "codelldb" },
  handlers = {}
})
