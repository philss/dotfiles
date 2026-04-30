local langs = { "c", "lua", "vim", "vimdoc", "query", "elixir", "rust", "zig", "typescript" }

require("nvim-treesitter").install(langs):wait(300000)

vim.api.nvim_create_autocmd("FileType", {
  pattern = langs,
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- vim.wo.foldmethod = 'expr'
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
