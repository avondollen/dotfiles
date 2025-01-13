--- Main NeoVim Configuration -----

-- Set VIM Global Settings before installing Lazy
require("config.vim-global")

--- Use LazyVim to setup all the plugins they lazy way
require("config.lazy")

--- VIM Settings
require("config.vim-cmd")
require("config.vim-options")
require("config.vim-keymaps")