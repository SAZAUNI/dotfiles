-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
vim.g.mapleader = " "-- sets leader key
vim.g.netrw_banner = 0-- gets rid of the annoying banner for netrw
vim.g.netrw_altv = 1-- change from left splitting to right splitting
vim.g.netrw_liststyle=3-- tree style view in netrw
vim.opt.title = true-- show title
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false-- turn off vi compatibility mode
vim.opt.number = true-- turn on line numbers
vim.opt.relativenumber = true-- turn on relative line numbers
vim.opt.mouse = 'a'-- enable the mouse in all modes
vim.opt.ignorecase = true-- enable case insensitive searching
vim.opt.smartcase = true-- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = true-- disable all highlighted search results
vim.opt.incsearch = true-- enable incremental searching
vim.opt.wrap = false-- enable text wrapping
vim.opt.tabstop = 4-- tabs=4spaces
vim.opt.shiftwidth = 4
vim.opt.fileencoding = "utf-8"-- encoding set to utf-8
vim.opt.pumheight = 20-- number of items in popup menu
vim.opt.laststatus = 2-- always show statusline
vim.opt.signcolumn = "auto"
vim.opt.expandtab = false-- expand tab 
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.showmode = true
vim.opt.scrolloff = 8-- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8-- scroll page when cursor is 8 spaces from left/right
vim.opt.completeopt= { "menuone", "noselect" }
vim.opt.splitbelow = true-- split go below
vim.opt.splitright = true-- vertical split to the right
vim.opt.termguicolors = true-- enable 24-bit RGB colors in terminal
vim.cmd('colorscheme moonfly')-- set colorscheme to moonfly
vim.cmd [[
set path+=**
highlight Normal ctermbg=NONE guibg=NONE
filetype plugin on
set wildmenu
]]

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- reload config
map("n", "<leader><CR>", ":source ~/.config/nvim/init.lua<CR>")-- reload neovim config
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")
map("n", "<leader>d", ":bd! <CR>")-- Space+d delets current buffer

-- adjust split sizes easier
map("n", "<C-Left>", ":vertical resize +3<CR>")-- Control+Left resizes vertical split +
map("n", "<C-Right>", ":vertical resize -3<CR>")-- Control+Right resizes vertical split -
map("n", "<C-Up>", ":resize +3<CR>")-- Control+Up resizes horizontal split +
map("n", "<C-Down>", ":resize -3<CR>")-- Control+Down resizes horizontal split -

-- Open netrw in 25% split in tree view
--map("n", "<leader>e", ":25Lex<CR>")-- space+e toggles netrw tree view 

-- Open nvim tree
map("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")-- space+e toggloes nvim tree view

-- Visual Maps
map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")-- Replace all instances of highlighted words 

-- Copy to clipboard
map("x", "<C-c>", "\"+y")

-- No Highligh
map('n', '<esc>', ':noh<CR>', {silent = true})

-- center the cursor on screen when moving
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Mousewheel+shift
map("n", "<S-ScrollWheelUp>", "5zh", { noremap = true })
map("n", "<S-ScrollWheelDown>", "5zl", { noremap = true })

-- Move cursor horizontally
map("n", "<C-h>", "5zh", { noremap = true })
map("n", "<C-l>", "5zl", { noremap = true })

-- Terminal to Normal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Open terminal in vertical split in zsh
map("n", "<C-ñ>", ":cd %:p:h | 10split term://zsh<CR>i", { noremap = true, silent = true })

-- Close terminal in terminal mode with <C-w>q
map("t", "<C-ñ>", "<C-\\><C-n>:bd!<CR>", { noremap = true, silent = true })

-- Set Ctrl + C as ESC
map("i", "<C-c>", "<Esc>")

