require("snacks").setup({
	animate = { enabled = true },
	bigfile = { enabled = true },
	dim = { enabled = true },
	explorer = { enabled = true },
	image = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	layout = { enabled = true },
	notifier = { enabled = true },
	notify = { enabled = true },
	picker = {
		sources = {
			explorer = {
				enabled = true,
				hidden = true,
				auto_close = false,
				layout = {
					preset = "left",
					layout = { width = 0.2 }
				}
			}
		}
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	zen = { enabled = true },
})

