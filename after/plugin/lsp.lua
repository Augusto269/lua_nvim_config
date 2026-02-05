-- Consolidated LSP configuration
local lsp = require("lsp-zero")
local lspconfig_util = require("lspconfig.util")

lsp.preset("recommended")

-- Mason configuration
require("mason").setup({})

-- Autocompletion configuration with cmp
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
}
cmp.setup({ mapping = cmp_mappings })

-- LSP preferences
lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = { error = 'E', warn = 'W', hint = 'H', info = 'I' }
})

-- LSP keymap configuration
local lsp_attach = function(client, bufnr)
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
end

-- Extend lspconfig with custom settings
lsp.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Mason LSP config with handlers
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "rust_analyzer", "gopls" },
  automatic_installation = true,
  handlers = {
    -- Default handler for all servers
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    -- Custom handler for gopls
    gopls = function()
      require('lspconfig').gopls.setup({
        filetypes = { "go", "gomod" },
        root_dir = lspconfig_util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            analyses = { unusedparams = true, shadow = true },
            staticcheck = true,
          },
        },
      })
    end,
  },
})

-- Final configuration
lsp.setup()

-- Note: Flow LSP configuration removed as 'flow' is not a standard lspconfig server
-- If you need Flow support, consider using a different TypeScript/JavaScript LSP server
-- or configure it manually if you have a custom Flow LSP implementation
