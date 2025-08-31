-- Cargar configuraciones personalizadas
require("augustog.remap")
require("augustog.set")

-- Crear grupos de autocmd
local augroup = vim.api.nvim_create_augroup
local AugustogGroup = augroup('Augustog', {})
local yank_group = augroup('HighlightYank', {})
local autocmd = vim.api.nvim_create_autocmd
