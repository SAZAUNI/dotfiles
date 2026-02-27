require("snacks").setup({
	animate = { enabled = true },
	bigfile = { enabled = true },
	dim = { enabled = true },
	explorer = { enabled = true },
	image = { enabled = false },
	indent = { enabled = true },
	input = { enabled = true },
	layout = { enabled = true },
	lazygit = { enabled = true },
	notifier = { enabled = true },
	notify = { enabled = true },
	picker = {
		sources = {
			explorer = {
				enabled = true,
				hidden = true,
				ignored = true,
				auto_close = false,
				layout = {
					preset = "left",
					layout = { width = 0.2 }
				},
				win = {
					list = {
						keys = {
							["/"] = false,
							["<Esc>"] = false,
							["<C-c>"] = false
						}
					}
				}
			}
		}
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	rename = { enabled = true },
	statuscolumn = { enabled = true },
	terminal = { enabled = false },
	toggle = { enabled = true },
	words = { enabled = true },
	zen = { enabled = true },
})
