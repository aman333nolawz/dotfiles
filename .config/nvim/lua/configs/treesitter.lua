-- Treesitter folds
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.o.foldlevelstart = 99

require('nvim-treesitter.configs').setup({
  -- nvim-treesitter/nvim-treesitter (self config)
  auto_install = true,
  ensure_installed = {
    'c',
    'lua',
    'javascript',
    'markdown',
    'html',
    'css',
    'json',
    'bash',
    'python'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },

  -- windwp/nvim-ts-autotag
  autotag = {
    enable = true,
  },

 rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  },
})
