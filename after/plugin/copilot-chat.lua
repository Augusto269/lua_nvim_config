require("CopilotChat").setup {
  -- See Configuration section for options
  vim.api.nvim_set_keymap('n', '<leader>kp', ':CopilotChat<CR>', { noremap = true, silent = true })
}
