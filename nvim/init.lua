-- ~/.config/nvim/init.lua

-- Leader first
vim.g.mapleader = ","

-- Disable netrw early (nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("config.lazy")      -- lazy.nvim bootstrap + plugin specs
require("config.lsp")       -- your pyright config (framework-less)
