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

require("lazy").setup({
  "nvim-lua/plenary.nvim",

  -- Package required for icons for other packages
  { "nvim-tree/nvim-web-devicons" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- Color scheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("config.tokyonight")
    end,
  },

  -- Snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      animate = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      bigfile = { enabled = true },
      image = { enabled = true, doc = { inline = false } },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = {
        folds = {
          open = true,
        },
      },
      scroll = { enabled = true },
    },
    keys = {
      {
        "<leader>h",
        function()
          Snacks.picker.notifications()
        end,
        desc = "Notification History",
      },
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    },

    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map(
            "<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle
              .option("conceallevel",
                { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
              :map("<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle
              .option("background",
                { off = "light", on = "dark", name = "Dark Background" })
              :map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
          },
        },
        presets = {
          command_palette = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end,
  },

  -- Buffer line & Status line
  {
    "tamton-aquib/staline.nvim",
    event = { "BufReadPre", "BufNew" },
    config = function()
      require("config.staline")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup()
    end,
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     require("lualine").setup({
  --       theme = "tokyonight",
  --       sections = {
  --         lualine_x = {
  --           {
  --             require("noice").api.status.command.get,
  --             cond = require("noice").api.status.command.has,
  --             color = { fg = "#ff9e64" },
  --           },
  --         },
  --       },
  --     })
  --   end
  -- },

  -- Utilities and LSP and productive stuffs
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("config.telescope")
    end,
  },

  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      global_keymaps = true,
    },
  },

  -- Build system
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  {
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },

  -- Navgation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  -- Multicursor
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      set({ "n", "x" }, "<up>", function() mc.lineAddCursor(-1) end, { desc = "Add cursor above" })
      set({ "n", "x" }, "<down>", function() mc.lineAddCursor(1) end, { desc = "Add cursor below" })
      set({ "n", "x" }, "<leader><up>", function() mc.lineSkipCursor(-1) end, { desc = "Skip cursor above" })
      set({ "n", "x" }, "<leader><down>", function() mc.lineSkipCursor(1) end, { desc = "Skip cursor below" })

      -- Add or skip adding a new cursor by matching word/selection
      set({ "n", "x" }, "<leader>n", function() mc.matchAddCursor(1) end, { desc = "Add cursor to next word/selction" })
      set({ "n", "x" }, "<leader>s", function() mc.matchSkipCursor(1) end, { desc = "Skip cursor of next word/selction" })
      set({ "n", "x" }, "<leader>N", function() mc.matchAddCursor(-1) end, { desc = "Add cursor to prev word/selction" })
      set({ "n", "x" }, "<leader>S", function() mc.matchSkipCursor(-1) end,
        { desc = "Skip cursor of prev word/selction" })

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse)
      set("n", "<c-leftdrag>", mc.handleMouseDrag)
      set("n", "<c-leftrelease>", mc.handleMouseRelease)

      -- Disable and enable cursors.
      set({ "n", "x" }, "<c-q>", mc.toggleCursor)

      -- Pressing `gaip` will add a cursor on each line of a paragraph.
      set("n", "ga", mc.addCursorOperator)

      set("n", "<leader>a", mc.alignCursors, { desc = "Align cursor columns" })
      set("x", "<leader>c", mc.splitCursors, { desc = "Split visual selections by regex" })
      set("x", "M", mc.matchCursors, { desc = "Match new cursors within visual selections by regex" })
      set({ "n", "x" }, "<leader>A", mc.matchAllAddCursors, { desc = "Add cursor to all matches" })
      set("x", "<leader>t", function() mc.transposeCursors(1) end, { desc = "Transpose cursors clockwise" })
      set("x", "<leader>T", function() mc.transposeCursors(-1) end, { desc = "Transpose cursors anti-clockwise" })
      set("x", "I", mc.insertVisual, { desc = "Insert on each line of visual selections" })
      set("x", "A", mc.appendVisual, { desc = "Append on each line of visual selections" })
      set({ "n", "x" }, "g<c-a>", mc.sequenceIncrement, { desc = "Increment sequence" })
      set({ "n", "x" }, "g<c-x>", mc.sequenceDecrement, { desc = "Decrement sequence" })

      set("n", "<leader>/n", function() mc.searchAddCursor(1) end, { desc = "Add cursor to next search result" })
      set("n", "<leader>/N", function() mc.searchAddCursor(-1) end, { desc = "Add cursor to prev search result" })
      set("n", "<leader>/s", function() mc.searchSkipCursor(1) end, { desc = "Skip cursor of next search result" })
      set("n", "<leader>/S", function() mc.searchSkipCursor(-1) end, { desc = "Skip cursor of prev search result" })
      set("n", "<leader>/A", mc.searchAllAddCursors, { desc = "Add cursor to all search results" })

      -- Pressing `<leader>miwap` will create a cursor in every match of the
      -- string captured by `iw` inside range `ap`.
      -- This action is highly customizable, see `:h multicursor-operator`.
      set({ "n", "x" }, "<leader>m", mc.operator, { desc = "Multicursor operator" })

      set({ "n", "x" }, "]d", function() mc.diagnosticAddCursor(1) end, { desc = "Add cursor to next diagnostic" })
      set({ "n", "x" }, "[d", function() mc.diagnosticAddCursor(-1) end, { desc = "Add cursor to prev diagnostic" })
      set({ "n", "x" }, "]s", function() mc.diagnosticSkipCursor(1) end, { desc = "Skip cursor of next diagnostic" })
      set({ "n", "x" }, "[S", function() mc.diagnosticSkipCursor(-1) end, { desc = "Skip cursor of prev diagnostic" })

      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor, { desc = "Delete main cursor" })

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { link = "Cursor" })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>b",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },

        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format" },
        typst = { "typstyle" },
        go = { "gofmt" }
      },
      -- Set default options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      format_on_save = { lsp_fallback = true, timeout_ms = 500 },
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'saghen/blink.cmp'
    },
    config = function()
      require("config.lsp")
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },

  -- Completions
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'Exafunction/windsurf.nvim'
    },
    version = '*',
    opts = {
      keymap = { preset = 'enter' },
      appearance = {
        nerd_font_variant = 'normal'
      },
      completion = {
        documentation = { auto_show = false },
      },
      signature = { enabled = true },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
        providers = {
          codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
        },
        per_filetype = {
          codecompanion = { "codecompanion" },
        }
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  -- Auto pairs
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({ enable = true })
    end,
  },

  -- AI
  -- "github/copilot.vim",
  {
    "Exafunction/windsurf.nvim",
    config = function()
      require("codeium").setup({
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,
        }
      })
    end
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("config.autopairs")
    end,
  },

  -- Color
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require('colorizer').setup()
    end,
  },


  -- FASM
  {
    "fedorenchik/fasm.vim",
    config = function()
      vim.api.nvim_create_autocmd({ "BufReadPre", }, {
        pattern = "*.asm",
        command = 'let g:asmsyntax = "fasm"',
      })
    end
  },

  -- Misc
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      image_support = true
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 49,
    dependencies = {
      "saghen/blink.cmp"
    },
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
})
