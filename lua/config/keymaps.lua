-- Keybinding configurations

-- Neo-tree file explorer
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Explorer" })
vim.keymap.set("n", "<leader>f", ":Neotree focus<CR>", { desc = "Focus Explorer" })

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close buffer" })