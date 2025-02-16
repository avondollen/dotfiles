return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()

    require('lint').linters_by_ft = {
      cpp = {'cpplint'},
    }
  end,

  vim.keymap.set("n", "<leader>l", function()
    require('lint').try_lint()
  end, { desc = "Trigger linting for current file" })
}
