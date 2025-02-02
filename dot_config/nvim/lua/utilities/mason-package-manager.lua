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
local mpm = {"williamboman/mason.nvim", version='v1.*'}

mpm.lazy = false

mpm.opts = {
    ui = {
        border = 'rounded',
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

return mpm
