return {
    -- A Beautiful Status Line
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Bubbles config for lualine
    
        require('lualine').setup {
            options = {
              icons_enable = true,
              theme = 'catppuccin-mocha',
              component_separators = '',
              section_separators = { left = '', right = '' },
            },
            -- sections = {
            --   lualine_a = { "mode" },
            --   lualine_b = { "branch", "diff", "diagnostics" },
            --   lualine_c = { "filename" },
            --   lualine_x = { { get_venv }, { get_ros_distro }, "fileformat", "filetype" },
            --   lualine_y = { "progress" },
            --   lualine_z = { "location" },
            -- },
            sections = {
                lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'filename', 'branch' },
                lualine_c = {
                  '%=', --[[ add your center compoentnts here in place of this comment ]]
                },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = { 
                'lazy',
                'fzf',
                'man',
                -- 'mason',
                'neo-tree',
                -- 'toggleterm',
                -- 'trouble',
                -- 'nvim-dap-ui',
            },
        }
    end,
}