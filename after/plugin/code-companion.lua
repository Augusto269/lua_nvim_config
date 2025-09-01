require('claude-code').setup({
  window = {
    split_ratio = 0.3,
    position = "botright",
    enter_insert = true,
    hide_numbers = true,
    hide_signcolumn = true,
  },
  refresh = {
    enable = true,
    updatetime = 100,
    timer_interval = 1000,
    show_notifications = true,
  },
  git = {
    use_git_root = true,
  },
  shell = {
    separator = '&&',
    pushd_cmd = 'pushd',
    popd_cmd = 'popd',
  },
  command = "claude",
  command_variants = {
    continue = "--continue",
    resume = "--resume",
    verbose = "--verbose",
  },
  keymaps = {
    toggle = {
      normal = "<leader>cc",
      terminal = "<c-,>",
      variants = {
        continue = "<leader>cc",
        verbose = "<leader>cv",
      },
    },
    window_navigation = true,
    scrolling = true,
  }
})

-- Remaps personalizados para leer la respuesta
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*claude*",
  callback = function()
    local opts = { buffer = true, silent = true }
    
    -- Scroll hacia arriba
    vim.keymap.set('t', '<leader>ku', '<C-\\><C-n><C-u>', opts)
    vim.keymap.set('t', '<leader>kd', '<C-\\><C-n><C-d>', opts)
    
    -- Scroll página completa
    vim.keymap.set('t', '<leader>kb', '<C-\\><C-n><C-b>', opts)
    vim.keymap.set('t', '<leader>kf', '<C-\\><C-n><C-f>', opts)
    
    -- Ir al inicio/final
    vim.keymap.set('t', '<leader>kh', '<C-\\><C-n>gg', opts)
    vim.keymap.set('t', '<leader>ke', '<C-\\><C-n>G', opts)
    
    -- Volver al modo insert
    vim.keymap.set('t', '<leader>ki', 'i', opts)
  end,
})
