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
