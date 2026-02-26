-- Typst LSP
vim.lsp.config("tinymist", {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  settings = {
    exportPdf = "onSave",
    -- ...
  },
})

vim.lsp.enable("tinymist")
