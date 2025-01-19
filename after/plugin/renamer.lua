require('renamer').setup()

vim.api.nvim_set_keymap(
  'n', -- Modo normal
  '<Space>rn', -- Combinación de teclas
  '<cmd>lua require("renamer").rename()<CR>', -- Comando a ejecutar
  { noremap = true, silent = true } -- Opciones (sin mapeo recursivo y silencioso)
)

