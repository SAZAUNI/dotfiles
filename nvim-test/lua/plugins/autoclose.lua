require("autoclose").setup({
  keys = {
	['"'] = { escape = false, close = false, pair = '""' },
	["'"] = { escape = false, close = false, pair = "''" },
	["`"] = { escape = false, close = false, pair = "``" },
  }
})
