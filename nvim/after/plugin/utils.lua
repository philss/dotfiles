-- Plugins that don't require too much configuration.

require("nvim-web-devicons").setup({})

require("staline").setup({})
require("stabline").setup({
  stab_bg = "#3b3735",
})

require("nvim-surround").setup({})

require("nvim_comment").setup({
  comment_empty = false,
  line_mapping = "<leader>cc",
  operator_mapping = "<leader>c",
})
