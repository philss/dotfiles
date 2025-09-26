-- Setup lazy.nvim, so we can plugins.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

  -- It's going to fail in the first installation. Run "update" to fix it.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- Utils
  "smoka7/hop.nvim",
  "terryma/vim-multiple-cursors",
  "terrortylor/nvim-comment",
  { "kylechui/nvim-surround", version = "*" },
  "adigitoleo/haunt.nvim",
  "tpope/vim-fugitive",

  -- Status bar
  "tamton-aquib/staline.nvim",

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Colorschemes
  { "embark-theme/vim", name = "embark" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin" },

  -- LSP
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },

  -- Completion
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },

  -- Visualize empty spaces on when in visual mode
  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,
    event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
    opts = {},
  },

  -- Snips
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
})
