-- Cargar configuraciones personalizadas
require("theprimeagen.remap")
require("theprimeagen.set")

-- Configuración de Monokai
require('monokai').setup { palette = require('monokai').pro }

-- Crear grupos de autocmd
local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})
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
    group = ThePrimeagenGroup,
    pattern = { "*", "!*.tsx" }, -- Aplica a todos menos a *.tsx
    command = [[%s/\s\+$//e]],
})
-- Configuración de netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Configuración de colores y clipboard
vim.cmd[[highlight ColorColumn ctermbg=0 guibg=lightgrey]]
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

-- Configuración de hlslens
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

vim.cmd('colorscheme solarized-osaka')

vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)


-- Configuración de nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "c", "lua", "vim", "vimdoc", "query", "vue", "heex" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

-- Configuración de LSP
require'lspconfig'.volar.setup{}
require'lspconfig'.elixirls.setup{
  cmd = { "/Users/augustogodoy/elixir-ls/scripts/language.server.sh" },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false
    }
  }
}
-- Remapear direcciones de movimiento
-- Mapeos en modo normal
-- Mapeos en modo normal
vim.api.nvim_set_keymap('n', 'e', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', 'h', 'h', { noremap = true })
vim.api.nvim_set_keymap('n', 't', 'l', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'j', { noremap = true })  -- Mantener 'j' para bajar

-- Asignar 'u' a deshacer en modo normal
vim.api.nvim_set_keymap('n', 'u', 'u', { noremap = true })

-- Asignar 'u' para deshacer en modo visual
vim.api.nvim_set_keymap('v', 'u', ':undo<CR>', { noremap = true, silent = true })
