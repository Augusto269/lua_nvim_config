local hop = require('hop')

-- Inicializa Hop
hop.setup()

-- Mapea Space + hs para ejecutar :HopWord
vim.keymap.set('', '<space>hs', ':HopWord<CR>', { noremap = true, silent = true })
