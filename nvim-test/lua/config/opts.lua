vim.g.copilot_enabled = false
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
vim.opt.laststatus = 3-- always show statusline
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
highlight Normal       guibg=NONE ctermbg=NONE
highlight NormalFloat  guibg=NONE ctermbg=NONE
highlight FloatBorder  guibg=NONE ctermbg=NONE
filetype plugin on
set wildmenu
]]
