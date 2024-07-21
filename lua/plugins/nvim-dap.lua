-- Debugging Support
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
	},
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text", -- inline variable text while debugging
			"nvim-telescope/telescope-dap.nvim", -- telescope integration with dap
			"https://github.com/nvim-neotest/nvim-nio",
		},
		opts = {
			controls = {
				element = "repl",
				enabled = false,
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = "",
				},
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = "",
			},
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.5,
						},
						{
							id = "stacks",
							size = 0.34,
						},
						{
							id = "watches",
							size = 0.15,
						},
						{
							id = "breakpoints",
							size = 0.01,
						},
					},
					position = "left",
					size = 50,
				},
				{
					elements = {
						{
							id = "console",
							size = 0.75,
						},
						{
							id = "repl",
							size = 0.25,
						},
					},
					position = "bottom",
					size = 10,
				},
			},
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t",
			},
			render = {
				indent = 1,
				max_value_lines = 100,
			},
		},
		config = function(_, opts)
			local dap = require("dap")
			require("dapui").setup(opts)

			dap.listeners.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				require("dapui").close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				require("dapui").close()
			end

			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
			vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

			vim.keymap.set("n", "<F1>", dap.continue)
			vim.keymap.set("n", "<F2>", dap.step_into)
			vim.keymap.set("n", "<F3>", dap.step_over)
			vim.keymap.set("n", "<F4>", dap.step_out)
			vim.keymap.set("n", "<F5>", dap.step_back)
			vim.keymap.set("n", "<F6>", dap.restart)
		end,
	},
}
