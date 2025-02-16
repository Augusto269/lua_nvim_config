require("debugprint").setup({
  move_to_debugline = true, -- Move cursor to the inserted print() line
  print_function = "console.warn", -- Use console.warn() instead of console.log()
})

local debugprint = require("debugprint")

-- Normal mode: Insert console.warn() at the current line
vim.keymap.set("n", "<leader>ms", function()
  debugprint.debugprint()
end, { noremap = true, silent = true })

-- Normal mode: Insert console.warn() below the current line
vim.keymap.set("n", "<leader>mb", function()
  debugprint.debugprint({ above = false })
end, { noremap = true, silent = true })

-- Visual mode: Properly insert console.warn() for selected variable
vim.keymap.set("v", "<leader>mm", function()
  debugprint.debugprint({ motion = true }) -- This tells debugprint to use visual selection
end, { noremap = true, silent = true })
