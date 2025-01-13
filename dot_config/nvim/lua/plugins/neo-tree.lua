return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim",
    },
    config = function()
        require("neo-tree").setup({
            -- Close Neo-tree if it is the last window left in the tab
            close_if_last_window = true,
            enable_git_status = false,
            window = {
                mappings = {
                  ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
                }
            },
            follow_current_file = {
                enabled = true, -- This will find and focus the file in the active buffer every time
                                -- the current file is changed while the tree is open.
            },
        })
    end,
}
