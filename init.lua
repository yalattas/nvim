-- Disable providers
vim.g.loaded_perl_provider = 0

-- Load core configuration
require("config")

-- Load plugin system
require("plugins")

-- Load keybindings
require("config.keymaps")
