-- Keybinding configurations

-- Neo-tree file explorer
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Explorer" })
vim.keymap.set("n", "<leader>m", ":Neotree last<CR>", { desc = "Focus Explorer" })

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close buffer" })

-- Diffview
vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<cr>")
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
