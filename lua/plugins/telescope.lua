return {
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require("lsp-file-operations").setup({
        defaults = {
          layout_config = {
            vertical = { width = 0.5 },
            mappings = {
              i = {
                ["<C-h>"] = "which_key"
              }
            },
          },
        },
      })
    end,
  }
}
