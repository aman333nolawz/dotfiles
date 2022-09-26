require("bufferline").setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true -- use a "true" to enable the default, or set your own character
      }
    },
    max_name_length = 14,
    max_prefix_length = 13,
    separator_style = "thin",
    diagnostics = 'nvim_lsp'
  },
})

