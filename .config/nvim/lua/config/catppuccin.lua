local transparent_background = false
local clear = {}

require("catppuccin").setup({
  flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
  background = { light = "latte", dark = "mocha" },
  dim_inactive = {
    enabled = false,
    -- Dim inactive splits/windows/buffers.
    -- NOT recommended if you use old palette (a.k.a., mocha).
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = transparent_background,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = true,
  compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
  styles = {
    comments = { "italic" },
    properties = { "italic" },
    functions = { "bold" },
    keywords = { "italic" },
    operators = { "bold" },
    conditionals = { "bold" },
    loops = { "bold" },
    booleans = { "bold", "italic" },
    numbers = {},
    types = {},
    strings = {},
    variables = {},
  },
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
    indent_blankline = { enabled = true },
    mason = true,
    nvimtree = true,
    telescope = { enabled = true, style = "nvchad" },
    treesitter_context = true,
    which_key = true,
  },
  color_overrides = {},
  highlight_overrides = {
    ---@param cp palette
    all = function(cp)
      return {
        -- For base configs
        NormalFloat = { fg = cp.text, bg = transparent_background and cp.none or cp.mantle },
        FloatBorder = {
          fg = transparent_background and cp.blue or cp.mantle,
          bg = transparent_background and cp.none or cp.mantle,
        },
        CursorLineNr = { fg = cp.green },

        -- For native lsp configs
        DiagnosticVirtualTextError = { bg = cp.none },
        DiagnosticVirtualTextWarn = { bg = cp.none },
        DiagnosticVirtualTextInfo = { bg = cp.none },
        DiagnosticVirtualTextHint = { bg = cp.none },
        LspInfoBorder = { link = "FloatBorder" },

        -- For mason.nvim
        MasonNormal = { link = "NormalFloat" },

        -- For indent-blankline
        IndentBlanklineChar = { fg = cp.surface0 },
        IndentBlanklineContextChar = { fg = cp.surface2, style = { "bold" } },

        -- For nvim-cmp and wilder.nvim
        Pmenu = { fg = cp.overlay2, bg = transparent_background and cp.none or cp.base },
        PmenuBorder = { fg = cp.surface1, bg = transparent_background and cp.none or cp.base },
        PmenuSel = { bg = cp.green, fg = cp.base },
        CmpItemAbbr = { fg = cp.overlay2 },
        CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
        CmpDoc = { link = "NormalFloat" },
        CmpDocBorder = {
          fg = transparent_background and cp.surface1 or cp.mantle,
          bg = transparent_background and cp.none or cp.mantle,
        },

        -- For fidget
        FidgetTask = { bg = cp.none, fg = cp.surface2 },
        FidgetTitle = { fg = cp.blue, style = { "bold" } },

        -- For nvim-tree
        NvimTreeRootFolder = { fg = cp.pink },
        NvimTreeIndentMarker = { fg = cp.surface0 },

        -- For trouble.nvim
        TroubleNormal = { bg = transparent_background and cp.none or cp.base },

        -- For telescope.nvim
        TelescopeMatching = { fg = cp.lavender },
        TelescopeResultsDiffAdd = { fg = cp.green },
        TelescopeResultsDiffChange = { fg = cp.yellow },
        TelescopeResultsDiffDelete = { fg = cp.red },

        -- For nvim-treehopper
        TSNodeKey = {
          fg = cp.peach,
          bg = transparent_background and cp.none or cp.base,
          style = { "bold", "underline" },
        },

        -- For treesitter
        ["@keyword.return"] = { fg = cp.pink, style = clear },
      }
    end,
  },
})
