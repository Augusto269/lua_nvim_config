require("codeium").setup({
  -- If you only want virtual text, you can disable cmp source:
  enable_cmp_source = false,
  virtual_text = {
    enabled = true,
    idle_delay = 75,
    map_keys = true,
    key_bindings = {
      accept = "<Tab>",
      next = "<M-]>",
      prev = "<M-[>",
    },
  },
})
