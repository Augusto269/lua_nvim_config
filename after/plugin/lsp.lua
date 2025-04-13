local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')
local lspconfig_configs = require('lspconfig.configs')
local lspconfig_util = require 'lspconfig.util'

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'gopls',   -- Added Go language server support
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn  = 'W',
        hint  = 'H',
        info  = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K",  function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd",  function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d",  function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d",  function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>",  function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>e", function()
    vim.diagnostic.open_float(0, { scope = "line" })
  end, { silent = true })
end)

-- Volar Setup for Vue (if needed)
local volar_cmd = { 'vue-language-server', '--stdio' }
local volar_root_dir = lspconfig_util.root_pattern 'package.json'
lspconfig.volar.setup({
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    settings = { volar = { } },
})

-- Go (gopls) Setup
lspconfig.gopls.setup({
  cmd = { "gopls" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  filetypes = { "go", "gomod" },
  root_dir = lspconfig_util.root_pattern("go.work", "go.mod", ".git"),
})

lsp.setup()
