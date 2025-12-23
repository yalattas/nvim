return {
	{
		"olimorris/codecompanion.nvim",
		version = "^18.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- "ravitemer/mcphub.nvim",
			"j-hui/fidget.nvim",
		},
		opts = {
			strategies = {
				chat = {
					adapter = "claude_code",
				},
				inline = {
					adapter = "claude_code",
				},
				cmd = {
					adapter = "claude_code",
				},
			},
			adapters = {
				acp = {
					claude_code = function()
						return require("codecompanion.adapters").extend("claude_code", {
							env = {
								ANTHROPIC_API_KEY = "cmd:op read op://Private/Anthropic/api_key --no-newline",
							},
						})
					end,
				},
			},
			display = {
				chat = {
					window = {
						position = "right",
					},
				},
			},
		},
		config = function(_, opts)
			require("codecompanion").setup(opts)

			local progress = require("fidget.progress")
			local handles = {}
			local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

			vim.api.nvim_create_autocmd("User", {
				pattern = "CodeCompanionRequestStarted",
				group = group,
				callback = function(event)
					handles[event.data.id] = progress.handle.create({
						title = "CodeCompanion",
						message = "Thinking...",
						lsp_client = { name = event.data.adapter.formatted_name },
					})
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "CodeCompanionRequestFinished",
				group = group,
				callback = function(event)
					local handle = handles[event.data.id]
					if handle then
						handle.message = event.data.status == "success" and "Done" or "Failed"
						handle:finish()
						handles[event.data.id] = nil
					end
				end,
			})
		end,
	},
}
