-- Plugin manager setup and configuration

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim with plugin specifications
require("lazy").setup({
  -- Load plugin configurations from separate files
  spec = {
    { import = "themes" },
    { import = "plugins.web-devicons" },
    { import = "plugins.neo-tree" },
    { import = "plugins.bufferline" },
    { import = "plugins.lualine" },
    { import = "plugins.lspconfig" },
    { import = "plugins.mason" },
    { import = "plugins.nvim-sops" },
    { import = "plugins.diffview" },
    { import = "plugins.lazygit" },
    { import = "plugins.telescope" },
    -- { import = "plugins.treesitter" }, -- doesn't seems to add value. Consider deleting it
    { import = "plugins.which-key" },
  },

  install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
