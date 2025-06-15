local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- LSP and completion
Plug("neoclide/coc.nvim", {branch = "release"})
Plug("nvim-treesitter/nvim-treesitter")

-- IDE enhancements
Plug("m4xshen/autoclose.nvim")
Plug("kylechui/nvim-surround")

-- AI assistant
Plug("github/copilot.vim")
Plug("nvim-lua/plenary.nvim")
Plug("CopilotC-Nvim/CopilotChat.nvim")

-- Search and file management
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

vim.call('plug#end')

-- Basics configurations
require("config/config")

require("gitsigns").setup()
require("autoclose").setup()
require("nvim-surround").setup()
require("colorizer").setup {}

require("plugins/treesitter")
require("plugins/nvim-tree")
require("plugins/copilotchat")
require("plugins/telescope")
