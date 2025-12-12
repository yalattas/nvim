# Installation
cd $HOME/.config
git clone git@github.com:yalattas/nvim.git nvim

# Key Bindings
## Explorer
- `<leader>e`: Toggle Explorer
- `<leader>m`: Back to Explorer
## Buffers (tabs)
- `TAB`: Next buffer
- `Shift+TAB`: Previous buffer
- `<leader>c`: Close buffer
## Diffview
- `<leader>do`: Open Diffview
- `<leader>dc`: Close Diffview

## LSP config
- `nvim-lspconfig` is installed and exposes all server configs through `vim.lsp.config` (Neovim 0.11+).
- Mason keeps the Python (`pyright`), JSON (`jsonls`), and YAML (`yamlls`) language servers installed so their default configs from `nvim-lspconfig` work out of the box.