-- Configuración consolidada de LSP
local lsp = require("lsp-zero")
local lspconfig_util = require("lspconfig.util")

lsp.preset("recommended")

-- Configuración de Mason
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "rust_analyzer", "gopls" },
  automatic_installation = true,
})

-- Configuración de autocompletado con cmp
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
}
cmp.setup({ mapping = cmp_mappings })

-- Preferencias de LSP
lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = { error = 'E', warn = 'W', hint = 'H', info = 'I' }
})

-- Configuración de mapeos LSP
lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local map = vim.keymap.set
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  map("n", "<leader>vd", vim.diagnostic.open_float, opts)
  map("n", "[d", vim.diagnostic.goto_next, opts)
  map("n", "]d", vim.diagnostic.goto_prev, opts)
  map("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  map("n", "<leader>vrr", vim.lsp.buf.references, opts)
  map("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- Configuración específica de servidores LSP
lsp.configure("flow", {
  cmd = { "npx", "ts_ls", "flow", "lsp" },
  filetypes = { "javascript", "javascriptreact" },
  root_dir = lspconfig_util.root_pattern(".flowconfig"),
  settings = {},
})

lsp.configure("gopls", {
  filetypes = { "go", "gomod" },
  root_dir = lspconfig_util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = { unusedparams = true, shadow = true },
      staticcheck = true,
    },
  },
})

-- Configuración final
lsp.setup()
