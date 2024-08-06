return {
	"robitx/gp.nvim",
	config = function()
		require("gp").setup({
			-- Set the OPENAI_API_KEY variable
			openai_api_key = os.getenv("OPENAI_API_KEY"),

			agents = {
				{
					provider = "openai",
					name = "ChatGPT4o-mini",
					chat = true,
					command = false,
					model = {
						model = "gpt-4o-mini",
						temperature = 1.1,
						top_p = 1.0,
					},
					system_prompt = "You are a general AI assistant.\n\n"
						.. "The user provided the additional info about how they would like you to respond:\n\n"
						.. "- If you're unsure don't guess and say you don't know instead.\n"
						.. "- Ask question if you need clarification to provide better answer.\n"
						.. "- Think deeply and carefully from first principles step by step.\n"
						.. "- Zoom out first to see the big picture and then zoom in to details.\n"
						.. "- Use Socratic method to improve your thinking and coding skills.\n"
						.. "- Don't elide any code from your output if the answer requires coding.\n"
						.. "- Take a deep breath; You've got this!\n",
				},
				{
					name = "ChatGPT4o",
					disable = true,
				},
				{
					name = "ChatGPT3-5",
					disable = true,
				},
			},
			chat_topic_gen_model = "gpt-4o-mini",

			-- Keymap Settings
			vim.keymap.set("n", "<leader>gp", ":GpChatToggle vsplit<CR>"),
			vim.keymap.set("n", "<leader>gn", ":GpChatNew<CR>"),
			vim.keymap.set("n", "<leader>gr", ":GpChatRespond<CR>"),
		})
	end,
}
