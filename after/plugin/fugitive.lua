vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = ThePrimeagen_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)
        -- Git Status
        --
        vim.keymap.set('n', '<leader>gs', ':Git <CR>,{}')
        -- Git Diff file
                vim.keymap.set('n', '<leader>gv', ':Gvdiff <CR>,{}')


        -- Git Commit
        vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true })


        -- Shortcut to select a branch for pushing and setting up tracking
        vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts)

        -- Shortcut to get changes from the left buffer (buffer 2)
        vim.keymap.set("n", "<leader>dg2", ":diffget 2<CR>", opts)

        -- Shortcut to get changes from the right buffer (buffer 3)
        vim.keymap.set("n", "<leader>dg3", ":diffget 3<CR>", opts)
          -- Navegar al siguiente diff en conflicto
       vim.keymap.set("n", "<leader>dgn", "]c", opts)

        -- Navegar al anterior error con <leader>
        vim.keymap.set("n", "<leader>dgp", "[c", opts)
        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
    end,
})

vim.api.nvim_set_keymap(
  "n",
  "<leader>gu",
  ":Git blame<CR>:GBrowse!<CR>",
  { noremap = true, silent = true }
)
