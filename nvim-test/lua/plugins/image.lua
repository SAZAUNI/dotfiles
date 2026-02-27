require("image").setup({
  backend = "sixel", -- or "ueberzug" or "sixel"
  processor = "magick_rock", -- or "magick_rock"
  integrations = {
    markdown = {
      enabled = false,
    },
	python = {
	  enabled = false,
	},
    html = {
      enabled = false,
    },
    css = {
      enabled = false,
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = nil,
  scale_factor = 1,
  window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
  editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})
