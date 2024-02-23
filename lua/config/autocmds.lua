vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("easycomments", { clear = true }),
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("q_to_quit", { clear = true }),
	pattern = {
		"",
		"DressingSelect",
		"Jaq",
		"checkhealth",
		"git",
		"help",
		"lir",
		"lspinfo",
		"man",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"netrw",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"TelescopeResults",
		"TelescopePrompt",
		"tsplayground",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close!<CR>
      set nobuflisted
      ]])
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	group = vim.api.nvim_create_augroup("quit_complete", { clear = true }),
	callback = function()
		vim.cmd("quit")
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = vim.api.nvim_create_augroup("vim_resized", { clear = true }),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("check_focus", { clear = true }),
	pattern = { "*" },
	callback = function()
		vim.cmd("checktime")
	end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = vim.api.nvim_create_augroup("check_focus", { clear = true }),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("markdown_format", { clear = true }),
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("cursor_position", { clear = true }),
	command = 'silent! normal! g`"zv',
})
