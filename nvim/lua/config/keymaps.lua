-- ~/.config/nvim/lua/config/keymaps.lua
local map = vim.keymap.set

-- Clipboard
map("v", "<C-y>", '"+y')
map("v", "<C-x>", '"+c')
map("i", "<C-p>", '<Esc>"+pa')
map("v", "<C-p>", 'c<Esc>"+p')

-- Word movement
map("i", "<S-Left>", "<Esc>bi")
map("n", "<S-Left>", "b")
map("i", "<S-Right>", "<Esc><Right>wi")
map("n", "<S-Right>", "w")

-- Indent
map("n", "<Tab>", ">>")
map("i", "<S-Tab>", "<Esc><<i")
map("n", "<S-Tab>", "<<")

-- Split navigation
map("n", "<leader><Up>", "<Cmd>wincmd k<CR>")
map("n", "<leader><Down>", "<Cmd>wincmd j<CR>")
map("n", "<leader><Left>", "<Cmd>wincmd h<CR>")
map("n", "<leader><Right>", "<Cmd>wincmd l<CR>")

-- Buffer navigation
map("n", "<leader>[", "<Cmd>bprevious!<CR>")
map("n", "<leader>]", "<Cmd>bnext!<CR>")
map("n", "<leader>x", "<Cmd>bdelete<CR>")

-- Clear search highlight
map("n", "<leader><space>", "<Cmd>nohlsearch<CR>")

-- Telescope buffers (nice modern buffer switch)
map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>")
map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>")
