-- ~/.config/nvim/lua/plugins/core.lua
return {
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- load early
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },

  -- Buffer tabs
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            { filetype = "NvimTree",   text = "File Explorer", highlight = "Directory", separator = true },
            { filetype = "NvimTree_1", text = "File Explorer", highlight = "Directory", separator = true },
            { filetype = "NvimTree_2", text = "File Explorer", highlight = "Directory", separator = true },
          },
        },
      })
    end,
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false, -- must be available at startup for `nvim .`
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})

      -- Auto-open tree when starting with a directory
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function(data)
          if vim.fn.isdirectory(data.file) == 1 then
            vim.cmd.cd(data.file)
            vim.schedule(function()
              require("nvim-tree.api").tree.open()
              vim.cmd("redrawtabline")
            end)
          end
        end,
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    --main = "nvim-treesitter.config",
    opts = {
      auto_install = true,
      disable = {"query", "vimdoc"},
      ensure_installed = {
          "lua",
          "markdown_inline",
          "markdown",
          "python",
          "vim",
          --"vimdoc",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    version = "v0.9.2",
  },

  -- Git signs (modern replacement for vim-gitgutter)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup({})
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },

  -- Optional: faster Telescope sorting
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      pcall(require("telescope").load_extension, "fzf")
    end,
  },

  -- VimWiki (keep if you like it)
  { "vimwiki/vimwiki", ft = "vimwiki" },
}
