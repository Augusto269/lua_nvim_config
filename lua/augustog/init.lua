require("augustog.remap")
require("augustog.set")

local augroup = vim.api.nvim_create_augroup
local AugustogGroup = augroup('Augustog', {})
local yank_group = augroup('HighlightYank', {})
local autocmd = vim.api.nvim_create_autocmd

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.api.nvim_create_user_command("GitLog", function()
  vim.cmd("split | term git log --oneline --decorate")
  vim.cmd("startinsert")
end, {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = AugustogGroup,
    pattern = { "*", "!*.tsx" },
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd[[highlight ColorColumn ctermbg=0 guibg=lightgrey]]
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

require('hlslens').setup()
local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "c", "lua", "vim", "vimdoc", "query", "vue", "heex" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

vim.api.nvim_set_keymap('n', 'e', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', 'h', 'h', { noremap = true })
vim.api.nvim_set_keymap('n', 't', 'l', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'j', { noremap = true })

vim.api.nvim_set_keymap('n', 'u', 'u', { noremap = true })
vim.api.nvim_set_keymap('v', 'u', ':undo<CR>', { noremap = true, silent = true })

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.showtabline = 1
