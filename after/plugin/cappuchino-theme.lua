require("catppuccin").setup({
  flavour = "frappe",
  transparent_background = true,
  term_colors = true,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = { "bold" },
    functions = { "bold" },
    keywords = { "italic" },
  },
})

vim.cmd("colorscheme catppuccin") -- Aplica el esquema después de la configuración
