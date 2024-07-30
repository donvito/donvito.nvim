return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
    },
    event = "InsertEnter",
    config = function()
      local cmp = require "cmp"
      local lspkind = require "lspkind"

      cmp.setup {
        -- Specify completion sources
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },

        mapping = cmp.mapping.preset.insert {
          ["<S-Tab>"] = cmp.mapping(function(fallback) -- complete
            if cmp.visible() then
              cmp.confirm { select = true }
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<Tab>"] = cmp.mapping(function(fallback) -- cycle
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        -- Configure how the completion menu appears
        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              path = "[Path]",
            },
          },
        },

        -- don't auto select item
        preselect = cmp.PreselectMode.None,

        -- Configure window for documentation
        window = {
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
      highlight = {
        enable = true,
      },
    },
  },
}
