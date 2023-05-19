-- Here are the basic settings for neovim.
-- See the docs: https://neovim.io/doc/user/options.html

-- Visual items
vim.opt.colorcolumn = "+1"
vim.opt.guicursor = ""
vim.opt.laststatus = 2 
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.termguicolors = true
vim.opt.textwidth = 98
vim.opt.visualbell = true

-- Indentation and spacing
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.sts = 2
vim.opt.tabstop = 2

-- Behaviour
vim.opt.autoread = true
vim.opt.mouse = "a"
vim.opt.undodir = os.getenv("HOME") .. "/tmp/neovim/undodir"
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.clipboard:append("unnamedplus")

-- Search 
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.updatetime = 50

-- Disabling the default file manager, because we are going to use nvim-tree.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
