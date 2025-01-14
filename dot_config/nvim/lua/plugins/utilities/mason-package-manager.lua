-----                               -----
----                                 ----
---               Mason               ---
--                                     --
-- Portable Package Manager for Neovim --
-- Helps with managing:                --
--   - LSP Servers                     --
--   - Linters                         --
--   - Formatters                      --
--   - DAP Servers                     --
-----------------------------------------

-----                   -----
--- Mason Package Manager ---
-----                   -----
local mpm = {"williamboman/mason.nvim"}

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