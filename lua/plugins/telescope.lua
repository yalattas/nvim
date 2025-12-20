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
            -- other layout configuration here
          },
          -- other defaults configuration here
        },
      })
    end,
  }
}
