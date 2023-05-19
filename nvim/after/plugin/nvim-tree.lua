require("nvim-tree").setup()

-- Mapping control + <tab> to go to the previous tab
vim.keymap.set("n", "T", ":NvimTreeToggle<CR>")
