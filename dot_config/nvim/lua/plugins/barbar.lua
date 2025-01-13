return {
    "romgrk/barbar.nvim", -- Tabline plugin that improves buffers and tabs
    lazy = true,
    event = "BufEnter",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.g.barbar_auto_setup = true
    end,
    opts = {
        -- Enable/Disable animations
        animation = true,

        --Enable/Disable current/total tabpages indicator (top right corner)
        tabpages = true,

        --Enable/disable clickable tabs
        --  - left-click: go to buffer
        --  - middle-click: delete buffer
        clickable = true,

        -- A buffer to this direction will be focused when closing the current buffer.
        focus_on_close = 'previous',

        -- Set the filetypes which barbar will offset itself
        sidebar_filetypes = {
            ['neo-tree'] = {event = 'BufWipeout'},
        },
    },
}