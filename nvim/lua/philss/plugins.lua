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
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { {"nvim-lua/plenary.nvim"} }
  },

  -- It's going to fail in the first installation. Run "update" to fix it.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- Utils
  "phaazon/hop.nvim",
  "terryma/vim-multiple-cursors",
  "terrortylor/nvim-comment",
  { "kylechui/nvim-surround", version = '*' },
  "adigitoleo/haunt.nvim",
  "tpope/vim-fugitive",

  -- Status bar
  -- "kyazdani42/nvim-web-devicons",
  "tamton-aquib/staline.nvim",

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },

  -- Minimap
  "gorbit99/codewindow.nvim",

  -- Colorschemes
  { "embark-theme/vim", name = "embark" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim" , name = "catppuccin" },
  'Mofiqul/vscode.nvim',

  -- LSP
  "neovim/nvim-lspconfig",
  { "elixir-tools/elixir-tools.nvim", dependencies = { 'nvim-lua/plenary.nvim' }},
  "simrat39/rust-tools.nvim",

  -- Completion
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  
  {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function
  },

  -- Snips
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip"
})
