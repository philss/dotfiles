-- Markdown LSP
vim.lsp.config("marksman", {
  cmd = { "marksman", "server" },
  root_markers = { ".marksman.toml", ".git" },
  file_types = { "markdown", "markdown.mdx" },
})

vim.lsp.enable("marksman")
