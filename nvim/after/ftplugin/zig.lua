local haunt = require("haunt")

-- Zig only accepts the file name.
function run_all_tests()
  local file = vim.fn.getreg("%")

  haunt.term({ fargs = { "zig", "test", file } })
end

vim.keymap.set("n", "<Leader>t", run_all_tests)
vim.keymap.set("n", "<Leader>a", run_all_tests)

-- Enable the LSP
vim.lsp.enable("zls")
