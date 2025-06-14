require("CopilotChat").setup {}

vim.keymap.set("n", "<C-A-i>", ":CopilotChatToggle<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat",
  callback = function()
    vim.keymap.set('i', '<C-c>', '<Nop>', { buffer = true })
  end,
})

