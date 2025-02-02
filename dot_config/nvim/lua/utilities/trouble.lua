-----                                      -----
----                                        ----
---                 Trouble                  ---
--                                            --
--    A pretty list for showing diagnostics,  --
-- references, telescope results, quickfix    --
-- and location lists to help you solve all   --
-- the trouble your code is causing.          --
--                                            --
------------------------------------------------
--   https://github.com/folke/trouble.nvim    --
------------------------------------------------

local trouble = {"folke/trouble.nvim", version='v3.*'}

-- Using Default Options
trouble.opts = {}

trouble.cmd = "Trouble"

trouble.keys = {
    {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
    },
    {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
    },
}

return trouble
