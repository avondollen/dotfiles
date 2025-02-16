return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()

    require('lint').linters_by_ft = {
      cpp = {
        'cpplint',
      }
    }

    -- Register the cpplint linter with multiple filters
    require('lint').linters.cpplint.args = {
      '--filter=-legal/copyright,\
-whitespace,\
-build/header_guard,\
-readability/namespace,\
-runtime/indentation_namespace,\
-readability/alt_tokens'
    }

  end,

  vim.keymap.set("n", "<leader>l", function()
    require('lint').try_lint()
  end, { desc = "Trigger linting for current file" })
}
