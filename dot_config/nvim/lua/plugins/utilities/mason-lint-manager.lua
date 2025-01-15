
return {
    "rshkarin/mason-nvim-lint",
    config = function()
      require('mason-nvim-lint').setup({
        ignore_install = {
            'clangtidy',
            'cppcheck',
        },
      })
    end
  }