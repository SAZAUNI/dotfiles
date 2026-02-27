local vim = vim

local Plug = vim.fn["plug#"]

----------------------Plugins calls--------------------------------------------
vim.call("plug#begin")

-- LSP
Plug("neovim/nvim-lspconfig") -- LSP config
Plug("williamboman/mason.nvim") -- LSP installer
Plug("williamboman/mason-lspconfig.nvim") -- Mason LSP config bridge
Plug("nvim-telescope/telescope-ui-select.nvim") -- Telescope UI select
Plug("nvimtools/none-ls.nvim")

-- Debugging
Plug("mfussenegger/nvim-dap")
Plug("jay-babu/mason-nvim-dap.nvim")
Plug("rcarriga/nvim-dap-ui")
Plug("nvim-neotest/nvim-nio")

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
Plug("mbbill/undotree")
Plug("m4xshen/autoclose.nvim")
Plug("kylechui/nvim-surround")
Plug("akinsho/toggleterm.nvim")		-- Toggle terminal

-- AI assistant
Plug("MunifTanjim/nui.nvim") --Dependency
--Plug("zbirenbaum/copilot.lua")
Plug("nvim-lua/plenary.nvim") --Dependency

-- Git integration
Plug("tpope/vim-fugitive")
Plug("lewis6991/gitsigns.nvim")

-- UI enhancements
Plug("akinsho/bufferline.nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("norcalli/nvim-colorizer.lua")
Plug("MeanderingProgrammer/render-markdown.nvim")
Plug("3rd/image.nvim")

-- Themes
Plug("projekt0n/github-nvim-theme")

-- Snacks nvim
Plug("folke/snacks.nvim")

vim.call("plug#end")
--------------------------------------------------------------------------------


-- Base configurations
require("config/opts")
require("config/commands")
require("config/keymaps")

-- No config's needed to use these plugins
require("nvim-surround").setup()
require("colorizer").setup()
require("bufferline").setup() -- adding tabs for buffer

-- Load plugin's configs
require("plugins/snacks")				-- Snacks plugin
require("plugins/completions")			-- Completion engine and sources
require("plugins/gitsigns")				-- Git integrations
require("plugins/lspconfig")			-- LSP configuration
require("plugins/mason")				-- LSP installer and config bridge
require("plugins/null-ls") 				-- LSP for formatting and diagnostics
require("plugins/render-markdown")		-- Markdown rendering
require("plugins/toggleterm")			-- Toggle terminal without lose session
require("plugins/image")				-- Render images inside neovim
require("plugins/treesitter")			-- Syntax highligthing
require("plugins/autoclose")			-- Better autoclose
require("plugins/dap")					-- Debugging
