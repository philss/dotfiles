-- For Elixir projects, we can run our tests inside a floating window.
local fterm = require('FTerm')

function run_tests()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local file = vim.fn.getreg('%')
  local command = 'mix test ' .. file .. ':' .. line

  fterm.scratch({ cmd = command })
end

function run_all_tests()
  local file = vim.fn.getreg('%')
  local command = 'mix test ' .. file

  fterm.scratch({ cmd = command })
end

-- Open tests with FTerm
vim.keymap.set('n', '<Leader>t', run_tests)
vim.keymap.set('n', '<Leader>a', run_all_tests)
