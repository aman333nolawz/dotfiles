vim.opt.completeopt = { "menu", "menuone", "noselect" }
require("luasnip.loaders.from_vscode").lazy_load()

-- Set up nvim-cmp.
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      -- col_offset = -3,
      side_padding = 0,
    },
    documentation = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        ellipsis_char = "...",
        symbol_map = { Codeium = "" },
      })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "path" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "codeium" },
  },
})

-- Customization for Pmenu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1a1b26", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#a9b1d6", bg = "#24283b" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#c0caf5", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#7aa2f7", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#7aa2f7", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#bb9af7", bg = "NONE", italic = true })

vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#8c4351", bg = "#f7768e" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#8c4351", bg = "#f7768e" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#8c4351", bg = "#f7768e" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#385f0d", bg = "#9ece6a" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#385f0d", bg = "#9ece6a" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#385f0d", bg = "#9ece6a" })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#8f5e15", bg = "#e0af68" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#8f5e15", bg = "#e0af68" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#8f5e15", bg = "#e0af68" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#5a3e8e", bg = "#bb9af7" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#5a3e8e", bg = "#bb9af7" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#5a3e8e", bg = "#bb9af7" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#5a3e8e", bg = "#bb9af7" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#5a3e8e", bg = "#bb9af7" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#343b58", bg = "#c0caf5" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#343b58", bg = "#c0caf5" })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#965027", bg = "#ff9e64" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#965027", bg = "#ff9e64" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#965027", bg = "#ff9e64" })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#0f4b6e", bg = "#7dcfff" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#0f4b6e", bg = "#7dcfff" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#0f4b6e", bg = "#7dcfff" })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#33635c", bg = "#73daca" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#33635c", bg = "#73daca" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#33635c", bg = "#73daca" })
