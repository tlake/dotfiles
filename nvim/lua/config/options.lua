-- ~/.config/nvim/lua/config/options.lua
local o = vim.opt

-- Better defaults
o.hidden = true
o.number = true
o.linebreak = true

o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.smartindent = true
o.autoindent = true

o.updatetime = 100
o.mouse = "a"

-- Encoding / fileformat
o.fileformat = "unix"
o.encoding = "utf-8"
o.fileencoding = "utf-8"

-- Don't auto-wrap at 79
o.textwidth = 0

-- Don't conceal markdown backticks, etc.
o.conceallevel = 0

-- statusline always visible
o.laststatus = 2
