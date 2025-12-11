-- Bufferline configuration for buffer/tab management

return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      -- Add any custom bufferline settings here
    })
  end,
}