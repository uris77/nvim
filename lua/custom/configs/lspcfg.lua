local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspcfg = require("lspconfig")
local util = require "lspconfig/util"


lspcfg.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod" , "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}


local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_command(params)
end

lspcfg.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    }
  }
}

-- Dart config
local dartExcludedFolders = {
  vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
  vim.fn.expand("$HOME/.pub-cache/"),
  vim.fn.expand("/opt/homebrew"),
  vim.fn.expand("$HOME/tools/flutter"),
}

lspcfg.dartls.setup({
  capabilities = capabilities,
  cmd = {
    "dart",
    "language-server",
    "--protocol=lsp",
  },
  filetypes = { "dart" },
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = false,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    outline = false,
    flutterOutline = false,
  },
  settings = {
    dart = {
      analysisExcludedFolders = dartExcludedFolders,
      updateImportsOnRename = true,
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
})
require("dart-tools")
