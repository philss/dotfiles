local haunt = require("haunt")

function run_suite()
  haunt.term({ fargs = { "deno", "test" } })
end

vim.keymap.set("n", "<Leader>t", run_suite)
vim.keymap.set("n", "<Leader>a", run_suite)
vim.keymap.set("n", "<Leader>s", run_suite)

-- Deno LSP
vim.lsp.config("denols", {
  cmd = { "deno", "lsp" },
  root_markers = { "deno.json", ".git" },
  file_types = { "typescript", "javascript" },
})

-- Enable the LSP
vim.lsp.enable("denols")
