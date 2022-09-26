require("nvim-tree").setup({
  view = {
    adaptive_size = false,
  },
  renderer = {
    highlight_opened_files = "name",
    indent_markers = {
      enable = true
    }
  },
  filters = { custom = { "^.git$" } }
})
