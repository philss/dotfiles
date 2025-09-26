-- This config is only loaded for Rust files.

-- Configures the LSP
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({ "hover", "actions" })
  end,
  { silent = true, buffer = bufnr }
)

-- Configures the floating terminal for tests.
local haunt = require("haunt")

-- Zig only accepts the file name.
function run_all_suite()
  haunt.term({ fargs = { "cargo", "test" } })
end

vim.keymap.set("n", "<Leader>t", run_all_suite)
vim.keymap.set("n", "<Leader>a", run_all_suite)
vim.keymap.set("n", "<Leader>s", run_all_suite)
