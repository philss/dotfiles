local hop = require("hop")

local directions = require("hop.hint").HintDirection

-- Highlight after cursor
vim.keymap.set("n", "<Leader>w", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { remap = true })

-- Highlight before cursor
vim.keymap.set("n", "<Leader>b", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { remap = true })

hop.setup({})
