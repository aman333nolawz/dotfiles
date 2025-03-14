require("tokyonight").setup({
  transparent = true,
  styles = {
    floats = "transparent",
    sidebars = "transparent",
  },
  on_highlights = function(hl, c)
    local prompt = "#332952"
    hl.TelescopeNormal = {
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      fg = "#0F0A1F",
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
      fg = "#64578F",
    }
    hl.TelescopeResultsTitle = {
      fg = "#64578F",
    }
  end,
})

vim.cmd.colorscheme "tokyonight-night"

