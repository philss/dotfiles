local haunt = require("haunt")

function run_tests()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local file = vim.fn.getreg("%")
  local file_and_line = file .. ":" .. line

  haunt.term({ fargs = { "mix", "test", file_and_line } })
end

function run_all_tests()
  local file = vim.fn.getreg("%")

  haunt.term({ fargs = { "mix", "test", file } })
end

function run_suite()
  haunt.term({ fargs = { "mix", "test" } })
end

vim.keymap.set("n", "<Leader>t", run_tests)
vim.keymap.set("n", "<Leader>a", run_all_tests)
vim.keymap.set("n", "<Leader>s", run_suite)

-- Elixir LSP
vim.lsp.config("expert", {
  cmd = { "expert" },
  root_markers = { "mix.exs", ".git" },
  file_types = { "elixir", "eelixir", "heex" },
})

-- Enable the LSP
vim.lsp.enable("expert")
