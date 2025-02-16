-----                                           -----
----                                             ----
---                   Mason Nvim Lint             ---
--                                                 --
--      A Neovim plugin that closes a gap between  --
--   mason.nvim and nvim-lint, it allows install   --
--   linters configured in nvim-lint.              --
--                                                 --
-----------------------------------------------------
-- https://github.com/rshkarin/mason-nvim-lint     --
-----------------------------------------------------
return {

  'rshkarin/mason-nvim-lint',
  version='v0.1.*',

  dependencies = {
    {'williamboman/mason.nvim'},
    {'mfussenegger/nvim-lint'},
  },

  config = function()
    require('mason-nvim-lint').setup({

      automatic_installation = false,

      ensure_installed = {
        "cpplint",
        "hadolint",
        "shellcheck",
      }
    })
  end
}
