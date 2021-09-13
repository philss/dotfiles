M = {}

function M.run_tests()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local file = vim.fn.getreg('%')
  local command = 'mix test ' .. file .. ':' .. line

  require('FTerm').scratch({ cmd = command })
end

function M.run_all_tests()
  local file = vim.fn.getreg('%')
  local command = 'mix test ' .. file

  require('FTerm').scratch({ cmd = command })
end

return M
