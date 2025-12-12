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
    end,
  },
}
