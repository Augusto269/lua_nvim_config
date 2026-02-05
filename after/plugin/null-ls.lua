local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
    debug = true,
    sources = {
        null_ls.builtins.formatting.mix.with({
            command = "mix", -- The mix command
            args = { "format", "--stdin-filename", "$FILENAME" },
            filetypes = { "elixir" }, -- Files to apply to
        }),
    },  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
 vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                -- Performs the same formatting on save as when pressing <Leader>f
                if vim.bo.filetype ~= "typescriptreact" then  -- Avoid TSX files
                    vim.lsp.buf.format({ bufnr = bufnr, async = false })  -- Synchronous formatting on save
                end
            end,
            desc = "[LSP] format on save",
        })    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})
