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
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("config.catppuccin")
    end
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies="catppuccin",
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
    dependencies = "catppuccin",
    config = function()
      require("bufferline").setup {
        highlights = require("catppuccin.groups.integrations.bufferline").get()
      }
    end
  },
  {
    'freddiehaddad/feline.nvim',
    config = function ()
      require("feline").setup{
        components = require("catppuccin.groups.integrations.feline").get()
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

	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
    dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
        lang = "python"
    },
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

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    package.loaded["feline"] = nil
    package.loaded["catppuccin.groups.integrations.feline"] = nil
    require("feline").setup {
      components = require("catppuccin.groups.integrations.feline").get(),
    }
  end,
})
