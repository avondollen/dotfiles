
-- specifing python path
vim.g.python3_host_prog = '/usr/bin/python3'

-- disable node.js and perl support
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"