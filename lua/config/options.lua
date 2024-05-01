-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Cursor Line
vim.opt.cursorline = true

-- Tab Stop
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable Smart Indent
vim.opt.smartindent = true

-- Do not wrap lines
vim.opt.wrap = false

-- Enable Mouse Mode
vim.opt.mouse = "a"

-- Enable the clipboard between OS and NVIM
vim.opt.clipboard = "unnamedplus"

-- Persistent undolist
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search configuration
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable actual colors
vim.opt.termguicolors = true

-- Allow for scrolling into the incomplete buffer
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Faster Completion
vim.opt.updatetime = 50

-- Set completeopt for better completion experience
vim.opt.completeopt = "menuone,noselect"

-- Column set to 88 for Python Ruff LSP
vim.opt.colorcolumn = "88"

-- Highlight on Yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Show NVIM tabs
vim.opt.showtabline = 1

-- Predictable pane splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Conceal Level for Obsidian Plugin
vim.opt.conceallevel = 1

-- Disable showing mode in command line since it is in status bar
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Allow Visual Block mode to use whitespace
vim.opt.virtualedit = "block"
