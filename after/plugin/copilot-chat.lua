-- Ensure CopilotChat is loaded before mapping keys
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require("CopilotChat").setup({
    window = {
        width = 80,
        height = 10,
    }
})
-- 🗨️ Open CopilotChat
map("n", "<leader>kk", ":CopilotChat<CR>", opts)

-- ✅ Accept the nearest suggestion with Tab
map("i", "<Tab>", "copilot#Accept('<Tab>')", { expr = true, silent = true })

-- 🔍 Show code difference (Diff)
map("n", "<leader>kd", ":CopilotChatDiff<CR>", opts)

-- ℹ️ Show chat info
 vim.api.nvim_set_keymap("n", "<leader>ki", ":CopilotChat<CR>", { noremap = true, silent = true })

-- ❌ Close the chat window
map("n", "<leader>kq", ":CopilotChatClose<CR>", opts)

-- 🔄 Reload chat context
map("n", "<leader>kr", ":CopilotChatContext<CR>", opts)

-- 📌 Make the current message sticky
map("n", "<leader>ks", ":CopilotChatSticky<CR>", opts)

-- 📜 Show chat history
map("n", "<leader>kh", ":CopilotChatHistory<CR>", opts)

-- ✏️ Explain selected code
map("v", "<leader>ke", ":CopilotChatExplain<CR>", opts)

-- 🛠️ Optimize selected code
map("v", "<leader>ko", ":CopilotChatOptimize<CR>", opts)

-- 🐛 Find and fix errors in selected code
map("v", "<leader>kf", ":CopilotChatFix<CR>", opts)

-- 🎨 Generate documentation for selected code
map("v", "<leader>kt", ":CopilotChatDocs<CR>", opts)

-- 🌍 Translate code/comments
map("v", "<leader>kT", ":CopilotChatTranslate<CR>", opts)

-- 🔀 Generate an alternative version of selected code
map("v", "<leader>ka", ":CopilotChatAlternative<CR>", opts)

-- 🖊️ Explain selected code in detail
map("v", "<leader>kx", ":CopilotChatExplainDetail<CR>", opts)

-- 📌 Review selected code
map("v", "<leader>kR", ":CopilotChatReview<CR>", opts)

-- ⚡ Generate tests for selected code
map("v", "<leader>kp", ":CopilotChatTests<CR>", opts)

-- 🚀 Execute a command in CopilotChat
map("n", "<leader>kc", ":CopilotChatCommand<CR>", opts)

-- 📂 Insert files into the chat context
map("n", "<leader>kF", ":CopilotChatInFile<CR>", opts)


-- ✅ Accept the nearest change (was <C-y>)
map("n", "<leader>ky", "<C-y>", opts)

-- 🔍 Show Copilot’s suggested changes (Diff)
map("n", "<leader>kd", ":CopilotChatDiff<CR>", opts)

-- 📌 Add diffs to quickfix list
map("n", "<leader>kq", "gqd", opts)

-- 📜 Open quickfix to review changes
map("n", "<leader>ko", ":copen<CR>", opts)

-- ✂️ Yank nearest diff (copy suggestion)
map("n", "<leader>kg", "gy", opts)
