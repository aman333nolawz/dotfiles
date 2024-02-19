local transparent_background = false
local clear = {}

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = transparent_background,
  term_colors = true,
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    alpha = true,
    cmp = true,
    indent_blankline = {
      enabled = true,
      scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
      colored_indent_levels = true,
    },

    mason = true,
    nvimtree = true,
    telescope = { enabled = true, style = "nvchad" },
    treesitter_context = true,
    which_key = true,
  },
})

vim.cmd.colorscheme "catppuccin"
