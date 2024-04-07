local gs = require "gitsigns"

local opts = {
  vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {}),
  vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {}),
  vim.keymap.set("n", "<leader>gb", function ()
    gs.blame_line { full = false }
  end),
  vim.keymap.set("n", "<leader>gd", function ()
    gs.diffthis()
  end),
  vim.keymap.set("n", "<leader>gD", function ()
    gs.diffthis '~'
  end),
}

return opts
