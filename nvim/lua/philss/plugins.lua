vim.pack.add({
  -- 'https://github.com/nvim-lua/plenary.nvim',
  -- { src = 'https://github.com/nvim-telescope/telescope.nvim', version = 'stable' },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/tamton-aquib/staline.nvim" },
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
  { src = "https://github.com/adigitoleo/haunt.nvim" },
  { src = "https://github.com/smoka7/hop.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/terryma/vim-multiple-cursors" },
  { src = "https://github.com/terrortylor/nvim-comment" },
  {
    src = "https://github.com/mrcjkb/rustaceanvim",
    version = vim.version.range("^9"),
  },
  {
    src = "https://github.com/kylechui/nvim-surround",
    version = vim.version.range("4.x"),
  },
})
