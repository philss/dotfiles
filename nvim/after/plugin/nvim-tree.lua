require("nvim-tree").setup()

-- Mapping `<shift> + t` to toggle the nvim-tree
vim.keymap.set("n", "T", ":NvimTreeToggle<CR>")
