  require("auto-session").setup {
    auto_restore_enabled = true,
    auto_save_enabled = true,
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    pre_save_cmds = { "NvimTreeClose" },  -- Close tree before saving session
    post_restore_cmds = { "NvimTreeOpen" } -- Reopen tree after restoring session
}
