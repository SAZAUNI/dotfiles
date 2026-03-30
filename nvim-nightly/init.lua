-- packer manager --
vim.pack.add({
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/projekt0n/github-nvim-theme" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/mbbill/undotree" },
})

require("mini.indentscope").setup()
require("mini.completion").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()
require("mini.cmdline").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.files").setup()
require("mini.icons").setup()
require("mini.pick").setup()
require("gitsigns").setup()

require("mason-lspconfig").setup()
require("bufferline").setup()
require("toggleterm").setup()
require("mason").setup()


-- opts --
vim.cmd("Gitsigns toggle_current_line_blame")
vim.cmd.colorscheme("github_dark_default")
vim.g.netrw_liststyle = 3
vim.o.relativenumber = true
vim.g.termguicolors = true
vim.g.netrw_banner = 0
vim.o.smartindent = true
vim.o.colorcolumn = "80"
vim.o.signcolumn = "yes"
vim.o.ignorecase = true
vim.o.updatetime = 50
vim.g.netrw_altv = 1
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.winborder = "rounded"
vim.g.mapleader = " "
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.incsearch = true
vim.o.scrolloff = 6
vim.o.swapfile = false
vim.o.hlsearch = true
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.tabstop = 2
vim.o.backup = false
vim.o.number = true
vim.o.mouse = "a"
vim.o.wrap = false


-- autocmd --
vim.api.nvim_create_user_command("Format", function()
	vim.lsp.buf.format({ async = false })
end, {})

-- Cambia el cwd solo al abrir Neovim
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local path = vim.fn.argv(0)
		if path == "" then
			path = vim.loop.cwd()
		end

		if vim.fn.isdirectory(path) == 1 then
			vim.cmd("cd " .. path)
		else
			vim.cmd("cd " .. vim.fn.fnamemodify(path, ":h"))
		end
	end
})


-- keymaps --
local map = vim.keymap.set

local Terminal = require("toggleterm.terminal").Terminal
local opencode = Terminal:new({
  cmd = "opencode",
  direction = "vertical",
  hidden = true,
})

function _TOGGLE_OPENCODE()
  opencode:toggle(math.floor(vim.o.columns * 0.3))
end


-- undotree mappings
map("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", { noremap = true, silent = true })

-- opencode side panel --
map("n", "<A-i>", "<cmd>lua _TOGGLE_OPENCODE()<CR>", { noremap = true, silent = true })
map("t", "<A-i>", "<cmd>lua _TOGGLE_OPENCODE()<CR>", { noremap = true, silent = true })

-- gitsigns mappings
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
map('n', '<leader>gs', ":Gitsigns stage_hunk<CR>")
map('n', '<leader>gr', ":Gitsigns reset_hunk<CR>")
map('n', '<leader>gu', ":Gitsigns undo_stage_hunk<CR>")
map('n', '<leader>gd', ":Gitsigns toggle_deleted<CR>")
map('n', '<leader>gn', ":Gitsigns next_hunk<CR>")
map('n', '<leader>gN', ":Gitsigns prev_hunk<CR>")

-- mini mappings
map("n", "<leader>e", ":lua MiniFiles.open()<CR>")
map("n", "<leader>fg", ":Pick grep_live<CR>")
map("n", "<leader>fr", ":Pick resume<CR>")
map("n", "<leader>ff", ":Pick files<CR>")
map("n", "<leader>fh", ":Pick help<CR>")

-- resizing mappings
map("n", "<C-Left>", ":vertical resize +3<CR>")
map("n", "<C-Right>", ":vertical resize -3<CR>")
map("n", "<C-Up>", ":resize +3<CR>")
map("n", "<C-Down>", ":resize -3<CR>")

-- terminal mappings
map("n", "<C-ñ>", "<cmd>ToggleTerm<CR>")
map("t", "<C-ñ>", "<cmd>ToggleTerm<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- buffer mappings
map("n", "<C-S-Tab>", ":bprevious<CR>")
map("n", "<leader>x", ":bdelete<CR>")
map("n", "<C-Tab>", ":bnext<CR>")

map("n", "<leader><CR>", ":so<CR>")
map("n", "<ESC>", ":noh<CR>", { silent = true })
map("i", "<C-c>", "<Esc>")

-- movement mappings
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-l>", "5zl")
map("n", "<C-h>", "5zh")

-- clipboard mapping
map("x", "<C-c>", "\"+y")


-- lsp config --
local servers = {
	"lua_ls",
	"clangd",
	"pyright"
}
for _, server in ipairs(servers) do
	local config = {
		on_attach = function(client, bufnr)
			local opts = { buffer = bufnr }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		end,
		flags = {
			debounce_text_changes = 150,
		},
	}

	if server == 'jdtls' then
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = vim.fn.stdpath("data") .. "/jdtls/workspaces/" .. project_name
		config.cmd = { "jdtls", "-data", workspace_dir }
	end

	vim.lsp.config(server, config)
end

vim.diagnostic.config( { virtual_text = true })
