-- Statusline that keeps the git branch and diagnostics visible during development.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          "diff",
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            colored = true,
          },
        },
        lualine_c = { "filename" },
        lualine_x = { "searchcount", "encoding", "fileformat", "filetype", "filesize" },
        lualine_y = { "progress", "tabs" },
        lualine_z = { "location", "lsp_status" },
      },
    })
  end,
}
