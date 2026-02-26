local haunt = require("haunt")

-- Zig only accepts the file name.
function run_all_tests()
  local file = vim.fn.getreg("%")

  haunt.term({ fargs = { "zig", "test", file } })
end

vim.keymap.set("n", "<Leader>t", run_all_tests)
vim.keymap.set("n", "<Leader>a", run_all_tests)

-- Zig LSP
vim.lsp.config("zls", {
  cmd = { "zls" },
  root_markers = { "build.zig" },
  file_types = { "zig" },
  settings = {
    zls = {
      -- Neovim already provides basic syntax highlighting
      semantic_tokens = "partial",
      -- Further information about build-on save:
      -- https://zigtools.org/zls/guides/build-on-save/
      -- enable_build_on_save = true,
    },
  },
})

-- Enable the LSP
vim.lsp.enable("zls")
