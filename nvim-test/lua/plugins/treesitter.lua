require("nvim-treesitter").setup({
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "java"},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (or "all")
	ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
	  enable = true,
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(ev)
	local max_filesize = 500 * 1024 -- 500 KB
	local ok, stats = pcall(vim.uv.fs_stat, vim.fs.normalize(ev.file))
	if ok and stats and stats.size < max_filesize then
	  pcall(vim.treesitter.start, ev.buf)
	  vim.bo[ev.buf].syntax = "on" -- Use regex based syntax-highlighting as fallback as some plugins might need it
	  --vim.wo.foldlevel = 99
	  --vim.wo.foldmethod = "expr"
	  --vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folds
	  --vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Use treesitter for indentation
	end
  end,
})
