local haunt = require('haunt')

haunt.setup()

-- For Elixir projects, we can run our tests inside a floating window.

function run_tests()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local file = vim.fn.getreg('%')
  local file_and_line = file .. ':' .. line

  haunt.term({ fargs = { "mix", "test", file_and_line } })
end

function run_all_tests()
  local file = vim.fn.getreg('%')

  haunt.term({ fargs = { "mix", "test", file } })
end

-- -- Open tests with FTerm
vim.keymap.set('n', '<Leader>t', run_tests)
vim.keymap.set('n', '<Leader>a', run_all_tests)
