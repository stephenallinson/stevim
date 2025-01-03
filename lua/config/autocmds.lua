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
		"chatgpt-input",
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
		"oil",
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

-- Enable markdown functionality that we don't want when coding
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("markdown_format", { clear = true }),
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt.conceallevel = 2
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
		vim.opt.colorcolumn = ""
		vim.keymap.set("n", "z=", require("telescope.builtin").spell_suggest, { desc = "Spell suggest" })
		-- require("cmp").setup({ enabled = false }) -- Disable cmp for Markdown
	end,
})

-- Save markdown periodically
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	group = vim.api.nvim_create_augroup("markdown_autosave", { clear = true }),
	pattern = { "markdown", "*.md" },
	callback = function()
		if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
			vim.api.nvim_command("silent update")
		end
	end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("cursor_position", { clear = true }),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
			return
		end
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("json_conceal", { clear = true }),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- Set built-in terminal settings

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("terminal_settings", { clear = true }),
	callback = function()
		local set = vim.opt_local
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0
		set.modified = false
		vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
	end,
})

-- Kill terminal buffers when quitting writing all buffers and quitting
vim.api.nvim_create_autocmd("QuitPre", {
	group = vim.api.nvim_create_augroup("CloseTermOnQuit", { clear = true }),
	pattern = "*",
	callback = function()
		for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
			if vim.bo[buffer].buftype == "terminal" then
				vim.cmd("bd! " .. buffer)
			end
		end
	end,
})
