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
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neomake/neomake'
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
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      config = function() require'nvim-tree'.setup {} end
  }

  -- Lang server and diagnostics
  -- watch out for Elixir LS setup:
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#elixirls
  use 'neovim/nvim-lspconfig'
  use 'tami5/lspsaga.nvim'
  use 'folke/lsp-colors.nvim'
  use 'simrat39/rust-tools.nvim'

  -- Completion
  use 'nvim-treesitter/completion-treesitter'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- ColorScheme
  use 'rktjmp/lush.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'rose-pine/neovim'
  use { 'embark-theme/vim', as = 'embark' }
end)
