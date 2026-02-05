require('renamer').setup()

vim.api.nvim_set_keymap(
  'n', -- Normal mode
  '<Space>rn', -- Key combination
  '<cmd>lua require("renamer").rename()<CR>', -- Command to execute
  { noremap = true, silent = true } -- Options (no recursive mapping and silent)
)
