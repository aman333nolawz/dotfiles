local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('ufo').setup()
require('mason').setup{
  PATH = "prepend",
}
require('mason-lspconfig').setup{
  ensure_installed = {
    "pyright",
    "emmet_ls",
    "html",
    "cssls",
    "lua_ls"
  }
}

local lsp_attach = function(_, _)
  -- Create your keybindings here...
end

-- Folding

local builtin = require("statuscol.builtin")
require("statuscol").setup{
	relculright = true,
	segments = {
		{ text = { "%s" }, click = "v:lua.ScSa" },
		{ text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
		{ text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" },
}}
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
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
        inlay_hints = {
          background = true,
        },
      },
      on_attach = lsp_attach,
      capabilities = capabilities,
    })
  end
})
