local colors = require("utils.colors")

require("tokyonight").setup({
  transparent = true,
  styles = {
    floats = "transparent",
    sidebars = "transparent",
  },
  on_highlights = function(hl, c)
    local prompt = colors.secondary

    hl.TelescopeNormal = {
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      fg = colors.bg,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      fg = colors.tertiary,
    }
    hl.TelescopeResultsTitle = {
      fg = colors.tertiary,
    }
  end,
})

vim.cmd.colorscheme "tokyonight-night"
