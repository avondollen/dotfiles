return {

    -- Mason Package manager
    "williamboman/mason.nvim",
    
    config = function()
        -- Initalize Mason
        require("mason").setup({
            ui = {
                border = 'rounded',
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
        })
    end,
}