require("tokyonight").setup({
  transparent = true,
  styles = {
    floats = "transparent",
    sidebars = "transparent",
  },
  on_highlights = function(hl, c)
    local prompt = "#293D52"
    hl.TelescopeNormal = {
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      fg = "#0C1926",
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
      fg = "#57738F",
    }
    hl.TelescopeResultsTitle = {
      fg = "#57738F",
    }
  end,
})

vim.cmd.colorscheme "tokyonight-night"

