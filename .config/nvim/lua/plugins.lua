-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'

  ------------------
  --    Nice UI   --
  ------------------

  use({
    'kyazdani42/nvim-web-devicons',
    event = "VimEnter",
    config = function()
      require('nvim-web-devicons').setup()
    end
  })

  use({
    'nvim-lualine/lualine.nvim',
    config = function()
      require("configs.lualine")
    end
  })

  use({
    'stevearc/dressing.nvim',
    event = "VimEnter",
    config = function()
      require("dressing").setup()
    end

  })

  use({
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    after = "nvim-web-devicons",
    config = function() require("configs.bufferline") end
  })

  use {
    'goolord/alpha-nvim',
    config = function ()
      require("configs.dashboard")
    end
  }

  use({
    "folke/which-key.nvim",
    config = function()
      require("configs.which-key")
    end,
  })

  use { 'dracula/vim', as = "dracula" }

  -----------------------------------
  -- Treesitter: Better Highlights --
  -----------------------------------

  use({
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      event = { "BufRead", "BufNewFile" },
      config = function()
        require('configs.treesitter')
      end,
    },
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
    { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }
  })

  ------------------
  --    Tools     --
  ------------------
  use 'AndrewRadev/splitjoin.vim'
  use 'famiu/bufdelete.nvim'

  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("configs.auto-save")
    end,
  })

  use({
    'norcalli/nvim-colorizer.lua',
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end
  })

  use({
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = function()
      require("indent_blankline").setup()
    end
  })

  use({
    'CRAG666/code_runner.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("configs.code_runner")
    end
  })

  use({
    'nvim-telescope/telescope.nvim',
    config = function()
      require("configs.telescope")
    end,
  })

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  ------------------
  --   Terminal   --
  ------------------
  use({
    'akinsho/toggleterm.nvim',
    config = function()
      require("configs.toggleterm")
    end
  })

  ------------------
  --  Navigation  --
  ------------------

  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require("configs.nvim-tree")
    end
  })

  ------------------
  --     LSP      --
  ------------------

  use({
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end
  })

  use {
    "williamboman/mason-lspconfig.nvim",
    config = function() require("mason-lspconfig").setup() end
  }

  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('configs.lsp.servers')
    end,
    requires = {
      {
        -- WARN: Unfortunately we won't be able to lazy load this
        'hrsh7th/cmp-nvim-lsp',
      },
    },
  })

  use({
    {
      'hrsh7th/nvim-cmp',
      config = function()
        require('configs.lsp.nvim-cmp')
      end,
      requires = {
        {
          'L3MON4D3/LuaSnip',
          config = function()
            require('configs.lsp.luasnip')
          end,
          requires = {
            {
              'rafamadriz/friendly-snippets',
              event = 'CursorHold',
            },
          },
        },
      },
    },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
  })

  use({
    'jose-elias-alvarez/null-ls.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function()
      require('configs.lsp.null-ls')
    end,
  })

 use({
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    event = "InsertEnter",
    config = function()
      require('configs.nvim-autopairs')
    end,
  })

end)

