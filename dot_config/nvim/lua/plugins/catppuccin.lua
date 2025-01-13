return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = 'mocha',
            transparent_background = true,

            default_integrations = false,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = false,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = false,
                    indentscope_color = "",
                },
            }
        })
        
--         vim.cmd.colorscheme "catppuccin"
    end
}