return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup({
        use_icons = true,
        show_help_hints = true,
        watch_index = true,
        icons = {                 -- Only applies when use_icons is true.
          folder_closed = "",
          folder_open = "",
        },
        signs = {
          -- keep the fold indicators compact
          fold_closed = "▶",
          fold_open = "▼",
        },
      })
    end,
  },
}
