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
map("n", "<leader>b", ":lua require(\"snacks\").picker.buffers()<CR>")-- Space+d delets current buffer

-- Adjust split sizes easier
map("n", "<C-Left>", ":vertical resize +3<CR>")-- Control+Left resizes vertical split +
map("n", "<C-Right>", ":vertical resize -3<CR>")-- Control+Right resizes vertical split -
map("n", "<C-Up>", ":resize +3<CR>")-- Control+Up resizes horizontal split +
map("n", "<C-Down>", ":resize -3<CR>")-- Control+Down resizes horizontal split -

-- Open nvim tree
--map("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
map("n", "<leader>e", ":lua require(\"snacks\").picker.explorer()<CR>", { noremap = true, silent = true })

-- Open File picker
map("n", "<leader>ff", ":lua require(\"snacks\").picker.files()<CR>")

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

-- Set Ctrl + C as ESC in INSERT mode
map("i", "<C-c>", "<Esc>")

-- Open picker for diagnostics_buffer
map("n", "<leader>fd", ":lua require(\"snacks\").picker.diagnostics_buffer()<CR>")

-- Open general picker
map("n", "<leader>p", ":lua require(\"snacks\").picker()<CR>")

-- Open icons picker in INSERT MODE
map("i", "<C-e>", "<ESC>:lua require(\"snacks\").picker.icons()<CR>")
