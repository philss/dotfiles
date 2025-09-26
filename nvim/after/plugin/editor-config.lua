-- This file is useful to override config set by ".editorconfig" files.
require("editorconfig").properties.max_line_length = function(bufnr, val, opts)
  local ft = vim.bo.filetype

  if val and ft == "elixir" then
    -- remove text-width, and therefore the automatic wrapping.
    vim.bo.textwidth = 0
    -- set the column to this "max_line_length" position instead.
    vim.opt.colorcolumn = val
  end
end
