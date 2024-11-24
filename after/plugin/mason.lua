-- Inicializar mason.nvim
require('mason').setup()

-- Configuración de mason-lspconfig para instalar servidores LSP
require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'rust_analyzer' },  -- Usa 'ts_ls' en lugar de 'tsserver'
})

-- Configuración de nvim-lspconfig para ts_ls y rust_analyzer
local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup {}
lspconfig.rust_analyzer.setup {}

-- Otros ajustes adicionales para tu configuración de LSP pueden ir aquí
