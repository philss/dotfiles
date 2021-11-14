-- Use packer to manage plugins
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Langs
  use 'vim-ruby/vim-ruby'
  use 'cespare/vim-toml'
  use 'rust-lang/rust.vim'
  use 'wlangstroth/vim-racket'
  use 'ElmCast/elm-vim'
  use 'hashivim/vim-hashicorp-tools'
  use 'mracos/mermaid.vim'

  -- Plugins
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
  use 'neomake/neomake'
  use 'scrooloose/nerdtree'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'phaazon/hop.nvim'
  use 'terryma/vim-multiple-cursors'
  use 'mhinz/vim-mix-format'
  use 'farmergreg/vim-lastplace'
  use 'kyazdani42/nvim-web-devicons'
  use 'tamton-aquib/staline.nvim'
  use { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' }
  use 'blackCauldron7/surround.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'terrortylor/nvim-comment'
  use 'numtostr/FTerm.nvim'

  -- Lang server and diagnostics
  -- watch out for Elixir LS setup:
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#elixirls
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'folke/lsp-colors.nvim'
  use 'folke/trouble.nvim'
  use 'simrat39/rust-tools.nvim'

  -- Completion
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'nvim-lua/completion-nvim'
  use 'nvim-treesitter/completion-treesitter'
  use 'rafamadriz/friendly-snippets'

  -- ColorScheme
  use 'rktjmp/lush.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'rose-pine/neovim'
end)
