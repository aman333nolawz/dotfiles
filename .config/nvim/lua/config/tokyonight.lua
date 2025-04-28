require("tokyonight").setup({
  transparent = true,
  styles = {
    floats = "transparent",
    sidebars = "transparent",
  },
  on_highlights = function(hl, c)
    local prompt = "#292C52"
    hl.TelescopeNormal = {
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      fg = "#000327",
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
      fg = "#575B8F",
    }
    hl.TelescopeResultsTitle = {
      fg = "#575B8F",
    }
  end,
})

vim.cmd.colorscheme "tokyonight-night"

