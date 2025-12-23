-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
-- Install and lightly configure nvim-lspconfig without relying on the deprecated require("lspconfig") API
local lsp_attach_group = vim.api.nvim_create_augroup("YalattasLspAttach", { clear = true })

return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Provide lightweight keymaps that become available as soon as a server attaches.
			vim.api.nvim_create_autocmd("LspAttach", {
				group = lsp_attach_group,
				callback = function(args)
					local buf = args.buf
					local opts = { buffer = buf, remap = false }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				end,
			})

			-- Keep the log level at warn so users only see actionable diagnostics from Neovim.
			vim.lsp.set_log_level("warn")

			local default_capabilities = vim.lsp.protocol.make_client_capabilities()
			local cmp_capabilities = default_capabilities
			local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if cmp_ok and cmp_nvim_lsp then
				cmp_capabilities = cmp_nvim_lsp.default_capabilities(default_capabilities)
			end

			-- Register and enable the language servers that live under lua/lsp.
			local servers = {
				"jsonls",
				"lua_ls",
				"markdown_oxide",
				"pylsp",
				"sqls",
				"ts_ls",
				"vimls",
				"yamlls",
				"terraformls",
			}

			local enabled = {}
			for _, server_name in ipairs(servers) do
				local ok, config = pcall(require, "lsp." .. server_name)
				if ok and config then
					local server_capabilities =
						vim.tbl_deep_extend("force", {}, config.capabilities or {}, cmp_capabilities)
					local server_config = vim.tbl_deep_extend("force", {}, config, {
						capabilities = server_capabilities,
					})
					vim.lsp.config(server_name, server_config)
					enabled[#enabled + 1] = server_name
				else
					vim.notify(
						("Failed to load LSP config %s: %s"):format(server_name, config),
						vim.log.levels.WARN,
						{ title = "YalattasLsp" }
					)
				end
			end

			if #enabled > 0 then
				vim.lsp.enable(enabled)
			end
		end,
	},
}
