local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('lazy').setup({
  "nvim-lua/plenary.nvim",

  -- Package required for icons for other packages
  { 'nvim-tree/nvim-web-devicons' },

  -- Dashboard
  {
    'goolord/alpha-nvim',
    config = function ()
      require('config.alpha')
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "javascript", "html", "python" },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = { enable = true }
      })
    end
  },

  -- Color scheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("config.tokyonight")
    end
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    config = function ()
      require("config.nvim-tree")
    end
  },

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end,
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup{
        window = {
          backdrop = 1,
          width = 0.85,
          options = {
            number = false,
            relativenumber = false,
            -- foldcolumn = "0",
          }
        }
      }
    end
  },

  -- Buffer line & Status line
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require("bufferline").setup{}
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight'
        }
      }
    end
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require('dressing').setup()
    end
  },

  -- Utilities and LSP and productive stuffs
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("config.telescope")
    end,
  },
  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require("config.toggleterm")
    end
  },
  -- Comment
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  -- Build system
  {
    "Zeioth/compiler.nvim",
    cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
  },
  {
    "stevearc/overseer.nvim",
    commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1
      },
    },
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("config.lsp")
    end
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      'luukvbaal/statuscol.nvim'
    }
  },
  -- Completions
  { 'L3MON4D3/LuaSnip' },
  { 'hrsh7th/cmp-nvim-lsp', dependencies = { "onsails/lspkind.nvim" } },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-buffer' },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp")
    end
  },
  { 'saadparwaiz1/cmp_luasnip' },
  -- Auto pairs
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    config = function()
      require('nvim-ts-autotag').setup{ enable = true }
    end
  },
  "Exafunction/codeium.vim",
  {
    "windwp/nvim-autopairs",
    config = function()
      require("config.autopairs")
    end,
  },

  -- Color
  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup{
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      }
    end
  },
})

