vim.g.firenvim_config = {
	globalSettings = { alt = "all" },
	localSettings = {
		[".*"] = {
			takeover = "never",
			priority = 0,
			selector = "textarea",
			cmdline = "neovim",
			content = "text",
		}
	}
}

if vim.g.started_by_firenvim == true then
  vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', { noremap = true })
end

