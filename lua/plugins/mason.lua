-- Mason configuration to ensure Python, JSON, and YAML language servers are installed
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "jsonls", "yamlls" },
      })
    end,
  },
}
