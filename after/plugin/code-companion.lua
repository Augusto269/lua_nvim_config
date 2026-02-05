require("claudecode").setup({
  -- Server configuration
  port_range = { min = 10000, max = 65535 },
  auto_start = true,
  log_level = "info",
  terminal_cmd = "claude", -- Default command
  
  -- Send/focus behavior
  focus_after_send = false,
  
  -- Selection tracking
  track_selection = true,
  visual_demotion_delay_ms = 50,
  
  -- Terminal configuration (equivalent to previous window config)
  terminal = {
    split_side = "right", -- botright → right
    split_width_percentage = 0.30, -- split_ratio = 0.3
    provider = "auto", -- Auto-detects snacks.nvim
    auto_close = true,
    -- Use git root as working directory (equivalent to git.use_git_root)
    git_repo_cwd = true,
    -- Window options for snacks (equivalent to previous window config)
    snacks_win_opts = {
      -- enter_insert is handled automatically
      -- hide_numbers and hide_signcolumn can be configured here if needed
    },
  },
  
  -- Diff integration
  diff_opts = {
    auto_close_on_accept = true,
    vertical_split = true,
    open_in_current_tab = true,
    keep_terminal_focus = false,
  },
})

-- Custom keymaps for Claude Code
-- Main toggle (opens/focuses Claude Code)
vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCodeFocus<cr>', { desc = "Open/Focus Claude Code" })
-- Switch from Claude terminal to code window (keeps Claude open)
vim.keymap.set('t', '<leader>cq', '<C-\\><C-n><C-w>h', { desc = "Switch from Claude to code (keep Claude open)" })
-- Switch from code to Claude terminal (when Claude is already open)
vim.keymap.set('n', '<leader>cC', function()
  -- Try to move to right window, but don't error if it doesn't exist
  local success = pcall(function() vim.cmd('wincmd l') end)
  if not success then
    -- If no right window, try to focus Claude terminal
    vim.cmd('ClaudeCodeFocus')
  end
end, { desc = "Switch from code to Claude terminal" })

-- Command variants
vim.keymap.set('n', '<leader>cv', '<cmd>ClaudeCode --verbose<cr>', { desc = "Claude Code verbose" })
vim.keymap.set('n', '<leader>aC', '<cmd>ClaudeCode --continue<cr>', { desc = "Continue last Claude conversation" })
vim.keymap.set('n', '<leader>ar', '<cmd>ClaudeCode --resume<cr>', { desc = "Resume Claude (pick from history)" })
-- Open Claude with history picker
vim.keymap.set('n', '<leader>ch', '<cmd>ClaudeCode --resume<cr>', { desc = "Open Claude history picker" })

-- Send visual selection to Claude
vim.keymap.set('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>', { desc = "Send to Claude" })

-- Add current buffer
vim.keymap.set('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', { desc = "Add current buffer" })

-- Diff management
vim.keymap.set('n', '<leader>aa', function()
  -- Check if we're in a diff buffer before accepting
  local bufnr = vim.api.nvim_get_current_buf()
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local is_diff = bufname:match("%(proposed%)") or 
                  bufname:match("%(NEW FILE %- proposed%)") or
                  vim.b[bufnr].claudecode_diff_tab_name or
                  vim.b[bufnr].claudecode_diff_new_win
  
  if is_diff then
    -- Save the file to accept (standard Neovim diff behavior)
    vim.cmd('write')
  else
    -- Try Claude Code command as fallback
    local success = pcall(function()
      vim.cmd('ClaudeCodeDiffAccept')
    end)
    if not success then
      vim.notify("No Claude Code diff to accept", vim.log.levels.WARN)
    end
  end
end, { desc = "Accept diff" })

vim.keymap.set('n', '<leader>ad', function()
  -- Check if we're in a diff buffer before denying
  local bufnr = vim.api.nvim_get_current_buf()
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local is_diff = bufname:match("%(proposed%)") or 
                  bufname:match("%(NEW FILE %- proposed%)") or
                  vim.b[bufnr].claudecode_diff_tab_name or
                  vim.b[bufnr].claudecode_diff_new_win
  
  if is_diff then
    -- Close without saving to deny (standard Neovim diff behavior)
    vim.cmd('quit!')
  else
    -- Try Claude Code command as fallback
    local success = pcall(function()
      vim.cmd('ClaudeCodeDiffDeny')
    end)
    if not success then
      vim.notify("No Claude Code diff to deny", vim.log.levels.WARN)
    end
  end
end, { desc = "Deny diff" })

-- Buffer navigation for Claude Code diffs
-- Navigate between diff buffers (when Claude shows multiple files)
vim.keymap.set('n', '<leader>cn', '<cmd>bn<cr>', { desc = "Next buffer (Claude diff)" })
vim.keymap.set('n', '<leader>cp', '<cmd>bp<cr>', { desc = "Previous buffer (Claude diff)" })
-- Use Telescope builtin.buffers instead of direct command
vim.keymap.set('n', '<leader>cb', function()
  local builtin = require('telescope.builtin')
  builtin.buffers()
end, { desc = "List all buffers (Claude diffs)" })

-- Custom remaps for reading response in Claude terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*claude*",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    -- Check if keymaps already exist to avoid duplicates
    local existing = vim.api.nvim_buf_get_keymap(bufnr, 't')
    local has_maps = false
    for _, map in ipairs(existing) do
      if map.lhs == '<leader>ku' then
        has_maps = true
        break
      end
    end
    
    if not has_maps then
      local opts = { buffer = bufnr, silent = true, noremap = true }
      
      -- Scroll up
      vim.keymap.set('t', '<leader>ku', '<C-\\><C-n><C-u>', opts)
      vim.keymap.set('t', '<leader>kd', '<C-\\><C-n><C-d>', opts)
      
      -- Full page scroll
      vim.keymap.set('t', '<leader>kb', '<C-\\><C-n><C-b>', opts)
      vim.keymap.set('t', '<leader>kf', '<C-\\><C-n><C-f>', opts)
      
      -- Go to start/end
      vim.keymap.set('t', '<leader>kh', '<C-\\><C-n>gg', opts)
      vim.keymap.set('t', '<leader>ke', '<C-\\><C-n>G', opts)
      
      -- Return to insert mode
      vim.keymap.set('t', '<leader>ki', 'i', opts)
    end
  end,
})
