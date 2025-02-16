vim.api.nvim_set_keymap('n', '<leader>gu', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})

vim.api.nvim_set_keymap('v', '<leader>gu', '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {})
require('gitlinker').setup({
  opts = {
    add_current_line_on_normal_mode = true,
    action_callback = require('gitlinker.actions').open_in_browser,
    print_url = true,
  },
  callbacks = {
    -- GitHub y GitLab públicos (ya predefinidos en el plugin)
    ['github.com'] = require('gitlinker.hosts').get_github_type_url,
    ['gitlab.com'] = require('gitlinker.hosts').get_gitlab_type_url,

    -- Agregar GitLab Self-Hosted (tu empresa)
    ['gitlab.cookunity.com'] = require('gitlinker.hosts').get_gitlab_type_url,
  },
  mappings = '<leader>gu',
})
