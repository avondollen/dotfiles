-----                                                -----
----                                                  ----
---                   Mason LSP Config                 ---
--                                                      --
--      mason-lspconfig bridges mason.nvim with the     --
--   lspconfig plugin - making it easier to use both    --
--   plugins together.                                  --
--                                                      --
--  Documentation :help mason-lspconfig.nvim            --
----------------------------------------------------------
-- https://github.com/williamboman/mason-lspconfig.nvim --
----------------------------------------------------------

local mason_lsp_config = {'williamboman/mason-lspconfig.nvim', version='v1.*'}

mason_lsp_config.dependencies = {
  {'williamboman/mason.nvim'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
}

mason_lsp_config.opts = {

  -----                 -----
  ---   Install Servers   ---
  -----                 -----
  ensure_installed = {

    -- LSP Servers
    "bashls",
    "clangd",
    "docker_compose_language_service",
    "dockerls",
    "lua_ls",
  },
  -----                  -----
  ---   LSP Capabilities   ---
  -----                  -----
  handlers = {

    ['bashls'] = function()
      require('lspconfig').bashls.setup {
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
          settings = {},
      }
    end,

    ['clangd'] = function()
      require('lspconfig').clangd.setup {
        filetypes = { "c", "cc", "cpp", "cxx", "h", "hh", "hpp", "hxx" },
        --capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {},
        cmd = {
          "clangd",
          --compile-commands-dir=<string>
          "--background-index",
          "--completion-style=detailed",
          "--header-insertion=never",
          "--function-arg-placeholders",
          "--clang-tidy",
          "--clang-tidy-checks=-*,cert*,clang-analyzer-alpha.cplusplus.virtualCall,clang-analyzer-alpha.security.ArrayBoundV2,clang-analyzer-core.UndefinedBinaryOperatorResult,clang-analyzer-cplusplus.NewDelete,clang-analyzer-cplusplus.NewDeleteLeaks,clang-analyzer-unix.MismatchedDeallocatorclang-analyzer-unix.Malloc,misc-new-delete-overheads,misc-non-copyable-objects,misc-static-assert,clang-diagnostic-dangling-initializer-list,clang-diagnostic-delete-incomplete,clang-diagnostic-delete-non-virtual-dtor,clang-diagnostic-dynamic-class-memaccess,clang-diagnostic-exceptions,clang-diagnostic-implicit-int,clang-diagnostic-incompatible-pointer-types,clang-diagnostic-incompatible-pointer-types-discards-qualifiers,clang-diagnostic-int-conversion,clang-diagnostic-int-to-pointer-castclang-diagnostic-invalid-noreturn,clang-diagnostic-invalid-offsetof,clang-diagnostic-mismatched-new-delete,clang-diagnostic-parentheses,clang-diagnostic-reorder,clang-diagnostic-reserved-id-macro,clang-diagnostic-return-type,clang-diagnostic-sometimes-uninitialized,clang-diagnostic-unevaluated-expression,clang-diagnostic-uninitialized,clang-diagnostic-unsequenced,clang-diagnostic-user-defined-literals,clang-diagnostic-varargs,clang-diagnostic-vexing-parse,clang-diagnostic-trigraphs,clang-diagnostic-unreachable-code,clang-diagnostic-format,clang-diagnostic-cast-align,clang-diagnostic-cast-qual,clang-diagnostic-format-security,clang-diagnostic-sequence-point,clang-diagnostic-char-subscripts,clang-diagnostic-unused-parameter,clang-diagnostic-unused-value"
        },
      }
    end,

    ['docker_compose_language_service'] = function()
      require('lspconfig').docker_compose_language_service.setup {
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
          settings = {},
      }
    end,
         
    ['dockerls'] = function()
      require('lspconfig').dockerls.setup {
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
          settings = {},
      }
    end,
  
    ["lua_ls"] = function()
      local lspconfig = require("lspconfig")
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local runtime_path = vim.split(package.path, ';')

      table.insert(runtime_path, 'lua/?.lua')
      table.insert(runtime_path, 'lua/?/init.lua')

      lspconfig.lua_ls.setup {
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              version = 'LuaJIT',
              path = runtime_path
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'}
            },
            workspace = {
              library = {
                -- Make the server aware of Neovim runtime files
                vim.fn.expand('$VIMRUNTIME/lua'),
                vim.fn.stdpath('config') .. '/lua'
              },
              checkThirdParty = false
            },
            telemetry = {
              enable = false
            },
          }
        }
      }
    end,
  }
}

return mason_lsp_config
