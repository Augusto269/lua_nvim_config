-- Cargar configuraciones personalizadas
require("augustog.remap")
require("augustog.set")

-- Crear grupos de autocmd
local augroup = vim.api.nvim_create_augroup
local AugustogGroup = augroup('Augustog', {})
local yank_group = augroup('HighlightYank', {})
local autocmd = vim.api.nvim_create_autocmd

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
