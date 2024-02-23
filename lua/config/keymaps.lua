-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Default Keymappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Move with J and K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When moving up and down the file, center the view
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Leader Y will copy to OS buffer
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-s", "<cmd>update<CR>")

-- Disable the Q function
vim.keymap.set("n", "Q", "<nop>")

-- Autoformat with LSP
-- vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "Auto Format" })

-- Go through the cnext and cprev buffer
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- lnext and lprev keymaps
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Global find and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Find and Replace" })

-- Chmod in NVIM
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Switch Buffer with Backspace
vim.keymap.set("n", "<Backspace>", ":bprev<CR>")

-- Remap arrow keys to move between windows
vim.keymap.set("n", "<up>", "<C-w><up>")
vim.keymap.set("n", "<down>", "<C-w><down>")
vim.keymap.set("n", "<left>", "<C-w><left>")
vim.keymap.set("n", "<right>", "<C-w><right>")

-- Change the behaviour of 'j' and 'k' to go between word map
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- F10 and F11 to indent in N and V
vim.keymap.set("n", "<F10>", "<<")
vim.keymap.set("n", "<F11>", ">>")
vim.keymap.set("v", "<F10>", "<gv")
vim.keymap.set("v", "<F11>", ">gv")

-- Set re-do to U
vim.keymap.set("n", "U", "<C-r>")

-- Select All in Normal Mode
vim.keymap.set("n", "<leader>A", "ggVG")

-- Better indenting in Visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Better pasting in Visual mode (cut/paste)
vim.keymap.set("x", "p", [["_dP"]])
