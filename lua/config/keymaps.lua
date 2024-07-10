local opts = { noremap = true, silent = true }
-- Default Keymappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Move with J and K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- When moving up and down the file, center the view
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Leader Y will copy to OS buffer
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-s>", "<cmd>update<CR>")

-- Disable the Q function
vim.keymap.set("n", "Q", "<nop>")

-- Autoformat with LSP
-- vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "Auto Format" })

-- Go through the cnext and cprev buffer
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", opts)

-- lnext and lprev keymaps
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Global find and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Find and Replace" })

-- Chmod in NVIM
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })

-- Switch Buffer with Backspace
vim.keymap.set("n", "<Backspace>", ":bprev<CR>", opts)
vim.keymap.set("n", "<S-Backspace>", ":bnext<CR>", opts)

-- Remap arrow keys to move between windows
vim.keymap.set("n", "<up>", "<C-w><up>", opts)
vim.keymap.set("n", "<down>", "<C-w><down>", opts)
vim.keymap.set("n", "<left>", "<C-w><left>", opts)
vim.keymap.set("n", "<right>", "<C-w><right>", opts)

-- Change the behaviour of 'j' and 'k' to go between word map
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)

-- F10 and F11 to indent in N and V
vim.keymap.set("n", "<F10>", "<<", opts)
vim.keymap.set("n", "<F11>", ">>", opts)
vim.keymap.set("v", "<F10>", "<gv", opts)
vim.keymap.set("v", "<F11>", ">gv", opts)

-- Set re-do to U
vim.keymap.set("n", "U", "<C-r>", opts)

-- Select All in Normal Mode
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- Better indenting in Visual mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Better pasting in Visual mode (cut/paste)
vim.keymap.set("x", "p", [["_dP"]])

-- Open Terminal with Shortcut
vim.keymap.set("n", "<leader>ts", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
end)
