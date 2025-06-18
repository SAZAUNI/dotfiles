require("CopilotChat").setup({
	window = {
		layout = 'vertical',
		width = 0.25,
		height = 0.25,
	},
	references_display = 'virtual',
	clear_chat_on_new_prompt = false,
	chat_autocomplete = true,
	history_path = vim.fn.stdpath('data') .. '/copilotchat_history',

	-- UI design
	question_header = '  User  ',
	answer_header = '  Copilot  ',
	error_header = '  Error  ',
	separator = '────────────────',

	-- Mappings for Copilot Chat
	mappings = {
		complete = {
			insert = '<CR>',
		},
		close = {
			normal = 'q',
			insert = '<None>',
		},
		reset = {
			normal = '<C-l>',
			insert = '<C-l>',
		},
		submit_prompt = {
			normal = '<CR>',
			insert = '<C-s>',
		},
		accept_diff = {
			normal = '<C-CR>',
			insert = '<C-CR>',
		},
	},
})

-- Do Ctrl-C as ESC inside Copilot Chat
vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat",
  callback = function()
    vim.keymap.set('i', '<C-c>', '<Esc>', { buffer = true })
  end,
})

-- Key mappings to open Copilot Chat
vim.keymap.set("n", "<C-A-i>", ":CopilotChatToggle<CR>")
vim.keymap.set("v", "<C-A-i>", ":'<,'>CopilotChat<CR>")
