-----                                        -----
----                                          ----
---                 Git Signs                  ---
--                                              --
--         Super fast git decorations           --
--                                              --
-- Documentation :help gitsigns-usage           --
--------------------------------------------------
--  https://github.com/lewis6991/gitsigns.nvim  --
--------------------------------------------------
local git_signs = {'lewis6991/gitsigns.nvim', version='v0.9.*'}

git_signs.event = {'BufReadPre', 'BufNewFile'}

git_signs.opts = {

  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',

  -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame = true,

  current_line_blame_opts = {

    virt_text = true,

    -- 'eol' | 'overlay' | 'right_align'
    virt_text_pos = 'eol', 

    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },

}

return git_signs
