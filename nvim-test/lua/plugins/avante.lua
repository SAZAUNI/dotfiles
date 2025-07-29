local ok_lib, avante_lib = pcall(require, "avante_lib")
if not ok_lib then
  vim.notify("No se pudo requerir avante_lib (build fallido?)", vim.log.levels.ERROR)
  return
end
avante_lib.load()

require("avante").setup({
	provider = "copilot",
	windows = { width = 25 },
	auto_suggestion_provider = "copilot",
	file_selector = {
		provider = "snacks"
	}
})

