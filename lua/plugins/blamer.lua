return {
	{
		"APZelos/blamer.nvim",
		event = "BufReadPost",
		config = function()
			vim.g.blamer_enabled = 1
			vim.g.blamer_delay = 500
			vim.g.blamer_show_in_visual_modes = 0
			vim.g.blamer_show_in_insert_modes = 0
			vim.g.blamer_prefix = " > "
			vim.g.blamer_template = "<author> - <summary>"
			vim.g.blamer_relative_time = 1
			vim.api.nvim_set_hl(0, "Blamer", { link = "Comment" })
		end,
	},
}