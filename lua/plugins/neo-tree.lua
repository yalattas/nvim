-- Neo-tree file explorer configuration

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Neo-tree configuration can be expanded here if needed
    require("neo-tree").setup({
      -- Add any custom neo-tree settings here
    })
  end,
}