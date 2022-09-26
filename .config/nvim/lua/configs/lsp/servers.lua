local lsp = require('lspconfig')
local U = require('configs.lsp.utils')

---Common perf related flags for all the LSP servers
local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200,
}

---Common capabilities including lsp snippets and autocompletion
local capabilities = U.capabilities()

---Common `on_attach` function for LSP servers
---@param client table
---@param buf integer
local function on_attach(client, buf)
  --    U.disable_formatting(client)
  U.mappings(buf)
end

-- Disable LSP logging
--vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

-- Configuring native diagnostics
vim.diagnostic.config({
  virtual_text = {
    source = 'always',
  },
  float = {
    source = 'always',
  },
})

---List of the LSP server that don't need special configuration
local servers = {
  --'zls', -- Zig
  --'gopls', -- Golang
  --'tsserver', -- Typescript
  --'html', -- HTML
  --'cssls', -- CSS
  --'jsonls', -- Json
  --'yamlls', -- YAML
  --'emmet_ls', -- emmet-ls
  -- 'terraformls', -- Terraform
  "pyright", -- Python
  "sumneko_lua", -- Lua
}

for _, server in ipairs(servers) do
  lsp[server].setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = on_attach,
  })
end
