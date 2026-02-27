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

-- Buffers management
map("n", "<C-Tab>", ":bnext<CR>")
map("n", "<C-S-Tab>", ":bprevious<CR>")
map("n", "<leader>x", ":bd! <CR>")-- Space+d delets current buffer

-- Adjust split sizes easier
map("n", "<C-Left>", ":vertical resize +3<CR>")-- Control+Left resizes vertical split +
map("n", "<C-Right>", ":vertical resize -3<CR>")-- Control+Right resizes vertical split -
map("n", "<C-Up>", ":resize +3<CR>")-- Control+Up resizes horizontal split +
map("n", "<C-Down>", ":resize -3<CR>")-- Control+Down resizes horizontal split -

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

-- Set Ctrl + C as ESC in INSERT mode
map("i", "<C-c>", "<Esc>")

-- Flash nvim mapping
map("n", "<leader>s", ":lua require(\"flash\").jump()<CR>")		-- Space+d delets current buffer

-- Undotree toggle and focus
map("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", { noremap = true, silent = true })

-- Snacks keybindings
map("n", "<leader>b", ":lua require(\"snacks\").picker.buffers()<CR>")		-- Space+d delets current buffer
map("n", "<leader>e", ":lua require(\"snacks\").picker.explorer()<CR>", { noremap = true, silent = true })		-- Open File picker
map("n", "<leader>ff", ":lua require(\"snacks\").picker.files()<CR>")
map("n", "<leader>fg", ":lua require(\"snacks\").picker.grep()<CR>")		-- Grep a word from project
map("n", "<leader>fd", ":lua require(\"snacks\").picker.diagnostics_buffer()<CR>")		-- Open picker for diagnostics_buffer
map("n", "<leader>p", ":lua require(\"snacks\").picker()<CR>")		-- Open general picker
map("i", "<C-e>", "<ESC>:lua require(\"snacks\").picker.icons()<CR>")		-- Open icons picker in INSERT MODE

-- Gitsigns management
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
map('n', '<leader>gs', ": Gitsigns stage_hunk<CR>")
map('n', '<leader>gr', ": Gitsigns reset_hunk<CR>")
map('n', '<leader>gu', ": Gitsigns undo_stage_hunk<CR>")
map('n', '<leader>gd', ": Gitsigns toggle_deleted<CR>")
map('n', '<leader>gn', ": Gitsigns next_hunk<CR>")
map('n', '<leader>gN', ": Gitsigns prev_hunk<CR>")
map('n', '<leader>zz', ":lua require(\"snacks\").zen()<CR>")

-- Terminal to Normal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Toggleterm
map("n", "<C-ñ>", "<cmd>ToggleTerm<CR>")
map("t", "<C-ñ>", "<cmd>ToggleTerm<CR>")

-- Opencode side panel
local Terminal = require("toggleterm.terminal").Terminal
local opencode = Terminal:new({
  cmd = "opencode",
  direction = "vertical",
  hidden = true,
})

function _TOGGLE_OPENCODE()
  opencode:toggle(math.floor(vim.o.columns * 0.3))
end
map("n", "<A-i>", "<cmd>lua _TOGGLE_OPENCODE()<CR>", { noremap = true, silent = true })
map("t", "<A-i>", "<cmd>lua _TOGGLE_OPENCODE()<CR>", { noremap = true, silent = true })

-- Debugging
map("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true, silent = true })
map("n", "<leader>dr", ":DapContinue<CR>", { noremap = true, silent = true })

-- Formatting code
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format Document" })
