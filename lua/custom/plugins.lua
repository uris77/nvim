local plugins = {
  {
    "nvimtools/none-ls-extras.nvim",
    event = "VeryLazy",
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "eslint-lsp",
        "eslint_d",
        "prettier",
        "typescript-language-server",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspcfg"
    end,
    dependencies = {
      -- support for dart hot reload on save
			"RobertBrunhage/dart-tools.nvim",
    },
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "tpope/vim-rhubarb"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup()
      require "custom.configs.gitsigns"
    end
  },
  {
    "dart-lang/dart-vim-plugin",
    event = "VeryLazy",
  },
}

return plugins
