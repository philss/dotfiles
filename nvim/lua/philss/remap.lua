-- Mapping <tab> to change navigate on tabs
vim.keymap.set("n", "<tab>", ":tabnext<CR>")

-- Mapping control + <tab> to go to the previous tab
vim.keymap.set("n", "<S-tab>", ":tabprevious<CR>")

-- Move the text under selection to +1 or -2 lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
