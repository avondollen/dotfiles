-----                                      -----
----                                        ----
---                  Mason                   ---
--                                            --
--    Portable Package Manager for Neovim     --
--    Helps with managing:                    --
--      - LSP Servers                         --
--      - Linters                             --
--      - Formatters                          --
--      - DAP Servers                         --
--                                            --
------------------------------------------------
-- https://github.com/williamboman/mason.nvim --
------------------------------------------------

-----                   -----
--- Mason Package Manager ---
-----                   -----
return {

  'williamboman/mason.nvim',
  version='v1.*',

  dependencies = {
    {'WhoIsSethDaniel/mason-tool-installer.nvim'},
  },

  config = function()
    require('mason').setup({

      ui = {
          border = 'rounded',
          icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
          }
      }
    })

    require('mason-tool-installer').setup({

      ensure_installed = {

        -- LSP Servers
        "bashls",
        "clangd",
        "docker_compose_language_service",
        "dockerls",
        "lua_ls",

        -- Linters
        "cpplint",
        "hadolint",
        "shellcheck",

        -- DAP Servers

        -- Formatters
        "clang-format",

      }
    })

  end
}
