return {
    -- LSP Server Manager
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        "neovim/nvim-lspconfig",
    },

    config = function()
        -- Initalize Mason LSP Config
        require("mason-lspconfig").setup({
            ensure_installed = {
                "ansiblels",
                "bashls",
                "clangd",
                "dockerls",
                "docker_compose_language_service", 
                "lua_ls",
                "jsonls",
            },
        })
    end,
}