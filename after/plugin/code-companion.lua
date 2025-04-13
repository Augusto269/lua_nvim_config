require("codecompanion").setup({

    adapters = {
    copilot = function()
      return require("codecompanion.adapters").extend("copilot", {
        schema = {
          model = {
            default = "gpt-4o",
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "copilot",
    },
    inline = {
      adapter = "copilot",
    },
    agent = {
      adapter = "copilot",
    },
  },
  display = {
    chat = {
      window = {
        layout = "vertical", -- float | vertical | horizontal | buffer
        position = "right", -- Move chat to the right side of the screen

      },
    },
    inline = {
      diff = {
        hl_groups = {
          added = "DiffAdd",
        },
      },
    },
  },
})

-- Remappings en modo normal (abrir chat, aceptar cambios, etc.)
vim.keymap.set("n", "<leader>ha", "<cmd>CodeCompanionAccept<CR>", { desc = "Aceptar cambios CodeCompanion" })
vim.keymap.set("n", "<leader>hc", "<cmd>CodeCompanionChat<CR>",   { desc = "Abrir chat CodeCompanion" })
vim.keymap.set("n", "<leader>hi", "<cmd>CodeCompanionInline<CR>", { desc = "Acción inline CodeCompanion" })
vim.keymap.set("n", "<leader>hx", "<cmd>CodeCompanionClose<CR>",  { desc = "Cerrar chat CodeCompanion" })
vim.keymap.set("n", "<leader>hl", "<cmd>CodeCompanionClear<CR>",  { desc = "Limpiar chat CodeCompanion" })
vim.keymap.set("n", "<leader>hs", "<cmd>CodeCompanionStop<CR>",   { desc = "Detener generación CodeCompanion" })

-- Function to obtain the visual selection
local function get_visual_selection()
  local s_line, s_col = unpack(vim.fn.getpos("'<"), 2, 3)
  local e_line, e_col = unpack(vim.fn.getpos("'>"), 2, 3)
  if (e_line < s_line) or (e_line == s_line and e_col < s_col) then
    s_line, e_line = e_line, s_line
    s_col, e_col = e_col, s_col
  end
  local lines = vim.api.nvim_buf_get_lines(0, s_line - 1, e_line, false)
  if #lines == 0 then return "" end
  lines[1] = string.sub(lines[1], s_col)
  lines[#lines] = string.sub(lines[#lines], 1, e_col)
  return table.concat(lines, "\n")
end

-- Helper function to trim whitespace from a string
local function trim(s)
  return s:match("^%s*(.-)%s*$") or ""
end

-- Helper function to compress multiple consecutive newlines into a single newline
local function compress_newlines(s)
  return s:gsub("\n+", "\n")
end

-------------------------------------
-- Mapping for "Fix errors" (<leader>kf)
-------------------------------------
vim.keymap.set("v", "<leader>kf", function()
  local text = trim(get_visual_selection())
  text = compress_newlines(text)
  local prompt = "Fix errors in this code:\n" .. text
  prompt = prompt:gsub("\n", "\\n")  -- Replace newline characters with literal "\n"
  prompt = vim.fn.shellescape(prompt)
  vim.cmd("CodeCompanionChat " .. prompt)
end, { desc = "Fix errors in selected code" })

-------------------------------------
-- Mapping for "Refactor and improve" (<leader>kr)
-------------------------------------
vim.keymap.set("v", "<leader>kr", function()
  local text = trim(get_visual_selection())
  text = compress_newlines(text)
  local prompt = "Refactor and improve this code:\n" .. text
  prompt = prompt:gsub("\n", "\\n")
  prompt = vim.fn.shellescape(prompt)
  vim.cmd("CodeCompanionChat " .. prompt)
end, { desc = "Refactor and improve selected code" })

-------------------------------------
-- Mapping for "Explain code" (<leader>ke)
-------------------------------------
vim.keymap.set("v", "<leader>ke", function()
  local text = trim(get_visual_selection())
  text = compress_newlines(text)
  local prompt = "Explain this code:\n" .. text
  prompt = prompt:gsub("\n", "\\n")
  prompt = vim.fn.shellescape(prompt)
  vim.cmd("CodeCompanionChat " .. prompt)
end, { desc = "Explain selected code" })

-------------------------------------
-- Mapping for "Generate unit tests" with extra context (<leader>kt)
-------------------------------------
vim.keymap.set("v", "<leader>kt", function()
  local text = trim(get_visual_selection())
  text = compress_newlines(text)
  local extra = trim(vim.fn.input("Additional context for unit tests (optional): "))
  extra = compress_newlines(extra)
  -- Use colon and space instead of newlines between the instruction and the selected text
  local prompt = "Generate unit tests for this code: " .. text
  if extra and extra ~= "" then
    prompt = prompt .. " " .. extra
  end
  -- Replace any remaining newline characters with a space
  prompt = prompt:gsub("\n", " ")
  prompt = vim.fn.shellescape(prompt)
  vim.cmd("CodeCompanionChat " .. prompt)
end, { desc = "Generate unit tests for selected code (with extra context)" })


vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function(args)
    local bufnr = args.buf
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    -- Check if the buffer name contains "CodeCompanion"
    if bufname:find("CodeCompanion") then
      -- Make the buffer modifiable so that normal text motions work
      vim.bo[bufnr].modifiable = true
      -- Optionally set a filetype that supports paragraph navigation (e.g., markdown)
      vim.bo[bufnr].filetype = "markdown"

      -- Now map { and } to jump between paragraphs as in a normal text file
      vim.keymap.set("n", "{", "{", { buffer = bufnr, silent = true, desc = "Jump to previous paragraph" })
      vim.keymap.set("n", "}", "}", { buffer = bufnr, silent = true, desc = "Jump to next paragraph" })
    end
  end,
})
