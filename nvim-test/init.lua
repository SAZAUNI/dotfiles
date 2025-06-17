local vim = vim
local Plug = vim.fn["plug#"]

-- Plugins calls
vim.call("plug#begin")

-- LSP
Plug("neovim/nvim-lspconfig") -- LSP configuration
Plug("williamboman/mason.nvim") -- LSP installer
Plug("williamboman/mason-lspconfig.nvim") -- Mason LSP config bridge
Plug("nvim-telescope/telescope-ui-select.nvim") -- Telescope UI select
Plug("nvimtools/none-ls.nvim")

-- Completions
Plug("hrsh7th/nvim-cmp") -- Completion engine
Plug("hrsh7th/cmp-nvim-lsp") -- LSP completion source
Plug("hrsh7th/cmp-path") -- Path completion source

-- Snippets
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")
Plug("rafamadriz/friendly-snippets")

-- Syntax highlighting
Plug("nvim-treesitter/nvim-treesitter")

-- IDE enhancements
Plug("m4xshen/autoclose.nvim")
Plug("kylechui/nvim-surround")

-- AI assistant
Plug("github/copilot.vim")
Plug("nvim-lua/plenary.nvim")
Plug("CopilotC-Nvim/CopilotChat.nvim")

-- File management
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-tree/nvim-tree.lua")

-- Git integration
Plug("tpope/vim-fugitive")
Plug("lewis6991/gitsigns.nvim")

-- UI enhancements
Plug("nvim-tree/nvim-web-devicons")
Plug("norcalli/nvim-colorizer.lua")

-- Themes
Plug("navarasu/onedark.nvim")
Plug("bluz71/vim-moonfly-colors", { as = "moonfly" })
Plug("catppuccin/nvim", { as = "catppuccin" })

vim.call("plug#end")



-- Base configurations
require("config/config")

-- No config's needed for these plugins
require("autoclose").setup()
require("nvim-surround").setup()
require("colorizer").setup()

-- Load plugin's configs
require("plugins/treesitter") -- Treesitter configuration
require("plugins/completions") -- Completion engine and sources
require("plugins/lspconfig") -- LSP configuration
require("plugins/mason") -- LSP installer and config bridge
require("plugins/none-ls") -- LSP for formatting and diagnostics
require("plugins/copilotchat") -- Copilot chat integration
require("plugins/gitsigns") -- Git integrations
require("plugins/nvim-tree") -- File explorer
require("plugins/telescope") -- Fuzzy finder
