-- From: https://github.com/wbthomason/packer.nvim#quickstart

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- It's going to fail in the first installation. Run "update" to fix it.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Utils
  use 'phaazon/hop.nvim'
  use 'terryma/vim-multiple-cursors'
  use 'terrortylor/nvim-comment'
  use { 'kylechui/nvim-surround', tag = '*' }
  use 'numToStr/FTerm.nvim'
  use 'tpope/vim-fugitive'

  -- Status bar
  use 'kyazdani42/nvim-web-devicons'
  use 'tamton-aquib/staline.nvim'

  -- File tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  -- Colorschemes
  use { 'embark-theme/vim', as = 'embark' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'catppuccin/nvim' , as = 'catppuccin' }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use { 'elixir-tools/elixir-tools.nvim', requires = { 'nvim-lua/plenary.nvim' }}
  use 'simrat39/rust-tools.nvim'

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Snips
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
end)
