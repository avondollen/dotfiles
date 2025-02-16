-----                                              -----
----                                                ----
---                   NVim Treesitter                ---
--                                                    --
--    The goal of nvim-treesitter is both to provide  --
-- a simple and easy way to use the interface for     --
-- tree-sitter in Neovim and to provide some basic    --
-- functionality such as highlighting based on it     --
--                                                    --
-- Documentation :help nvim-treesitter-modules        --
--------------------------------------------------------
-- https://github.com/nvim-treesitter/nvim-treesitter --
--------------------------------------------------------

return {
   'nvim-treesitter/nvim-treesitter',
   version='v0.9.*',

   config = function ()
     require('nvim-treesitter.configs').setup({

       auto_install = true,

       highlight = {
         enable = true,
       },

       ensure_installed = {
         "bash",
         "c",
         "cpp",
         "diff",
         "dockerfile",
         "html",
         "javascript",
         "jsdoc",
         "json",
         "jsonc",
         "lua",
         "luadoc",
         "luap",
         "markdown",
         "markdown_inline",
         "python",
         "query",
         "regex",
         "toml",
         "tsx",
         "typescript",
         "vim",
         "vimdoc",
         "xml",
         "yaml"
      },
    })
  end
}
