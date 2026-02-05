  local tree = require("nvim-tree")
  local my_attach_config = function(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Define your keyboard shortcuts here
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
    vim.keymap.set('n', '<C-o>', api.node.navigate.parent_close, opts('Close Node'))
    vim.keymap.set('n', 'D', api.fs.trash, opts('Move to Trash'))
    vim.keymap.set('n', 's', api.node.run.system, opts('Run System Command'))
    vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse All'))
    vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Toggle Help'))
  end


  tree.setup({
    hijack_cursor = true,
    sync_root_with_cwd = true,
     view = {
  float = {
    enable = true,
    open_win_config = function()
      local screen_w = vim.o.columns
      local screen_h = vim.o.lines
      local win_w = math.floor(screen_w * 0.7)
      local win_h = math.floor(screen_h * 0.7)
      local win_col = math.floor((screen_w - win_w) / 2)
      local win_row = math.floor((screen_h - win_h) / 2 - 1)

      return {
        relative = "editor",
        border = "rounded",
        width = win_w,
        height = win_h,
        row = win_row,
        col = win_col,
      }
    end,
  },
  width = 100, -- This value is only used if float is disabled
},
    renderer = {
      full_name = true,
      group_empty = true,
      special_files = {},
      symlink_destination = false,
      indent_markers = {
        enable = true,
      },
      icons = {
        git_placement = "signcolumn",
        show = {
          file = true,
          folder = false,
          folder_arrow = false,
          git = true,
        },
      },
    },
    update_focused_file = {
      enable = true,
      update_root = true,
      ignore_list = { "help" },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    filters = {
        dotfiles = false,
      custom = {
        "^.git$",
      },
    },
    actions = {
      change_dir = {
        enable = false,
        restrict_above_cwd = true,
      },
      open_file = {
        resize_window = true,
        window_picker = {
          chars = "aoeui",
        },
      },
      remove_file = {
        close_window = false,
      },
    },
    log = {
      enable = false,
      truncate = true,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
        watcher = false,
      },
    },
  })
