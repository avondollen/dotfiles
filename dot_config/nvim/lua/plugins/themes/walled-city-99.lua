--- Theme that's dark gloomy, reminds me of the Walled City in Stray.
--- Best used with darker terminal themes like Catppucin Mocha

return {
    -----           -----
    --- Color Schemes ---
    -----           -----
    -- catppucin Transparent Color Scheme
    {
        "catppuccin/nvim",
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
        end
    },

    -- Tokyo Night Transparent Color Scheme
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        priority = 1000,
        config = function()
            local transparent = true -- set to true if you would like to enable transparency

            local bg = "#011628"
            local bg_dark = "#011423"
            local bg_highlight = "#143652"
            local bg_search = "#0A64AC"
            local bg_visual = "#275378"
            local fg = "#CBE0F0"
            local fg_dark = "#B4D0E9"
            local fg_gutter = "#627E97"
            local border = "#547998"

            require("tokyonight").setup({
                style = "night",
                transparent = transparent,
                styles = {
                    sidebars = transparent and "transparent" or "dark",
                    floats = transparent and "transparent" or "dark",
                },
                on_colors = function(colors)
                    colors.bg = bg
                    colors.bg_dark = transparent and colors.none or bg_dark
                    colors.bg_float = transparent and colors.none or bg_dark
                    colors.bg_highlight = bg_highlight
                    colors.bg_popup = bg_dark
                    colors.bg_search = bg_search
                    colors.bg_sidebar = transparent and colors.none or bg_dark
                    colors.bg_statusline = transparent and colors.none or bg_dark
                    colors.bg_visual = bg_visual
                    colors.border = border
                    colors.fg = fg
                    colors.fg_dark = fg_dark
                    colors.fg_float = fg
                    colors.fg_gutter = fg_gutter
                    colors.fg_sidebar = fg_dark
                end
            })
        end
    },

    -----                     -----
    --- Well Rounded Status Bar ---
    -----                     -----
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
    
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
                    'mason',
                    'neo-tree',
                    -- 'toggleterm',
                    -- 'trouble',
                    -- 'nvim-dap-ui',
                },
            }
        end,
    },
    -----                     -----
    --- Happy Little File Tree  ---
    -----                     -----
    {
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
                }
            })
        end
    },
    -----                                                -----
    --- I got tabs in da browser, I got tabs.. tabs, tabs  ---
    -----                                                -----
    {
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
            }
        }
    }
}
