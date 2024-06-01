if true then
  return {}
end

if false then
  return {

    {
      "Vigemus/iron.nvim",
      cmd = {
        "IronRepl",
        "IronReplHere",
        "IronRestart",
        "IronSend",
        "IronFocus",
        "IronHide",
        "IronWatch",
        "IronAttach",
      },
      keys = {
        "<space>sc",
        "<space>sc",
        "<space>sf",
        "<space>sl",
        "<space>su",
        "<space>sm",
        "<space>mc",
        "<space>mc",
        "<space>md",
        "<space>s<cr>",
        "<space>s<space>",
        "<space>sq",
        "<space>cl",

        { "<space>rs", "<cmd>IronRepl<cr>" },
        { "<space>rr", "<cmd>IronRestart<cr>" },
        { "<space>rf", "<cmd>IronFocus<cr>" },
        { "<space>rh", "<cmd>IronHide<cr>" },
      },
      main = "iron.core", -- <== This informs lazy.nvim to use the entrypoint of `iron.core` to load the configuration.
      opts = {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { "fish" },
            },
            r = {
              command = {
                "radian",
                "--profile=~/.config/nvim/extras/.radian_profile",
              },
            },
          },
          -- How the repl window will be displayed
          repl_open_cmd = "vertical split",
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          send_motion = "<space>sc",
          visual_send = "<space>sc",
          send_file = "<space>sf",
          send_line = "<space>sl",
          send_until_cursor = "<space>su",
          send_mark = "<space>sm",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = { italic = true },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      },
    },
  }
end

return {
  -- send code from python/r/qmd documents to a terminal or REPL
  -- like ipython, R, bash
  {
    "jpalardy/vim-slime",
    lazy = false,
    init = function()
      vim.b["quarto_is_python_chunk"] = false
      Quarto_is_in_python_chunk = function()
        require("otter.tools.functions").is_otter_language_context("python")
      end
      vim.b["quarto_is_" .. "r" .. "_chunk"] = false
      Quarto_is_in_r_chunk = function()
        require("otter.tools.functions").is_otter_language_context("r")
      end

      vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      call v:lua.Quarto_is_in_r_chunk()

      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      return [a:text]
      end

      endfunction
      ]])

      vim.g.slime_target = "neovim"
      vim.g.slime_python_ipython = 1
      -- vim.g.slime_menu_config = 1

      local function mark_terminal()
        if vim.b.terminal_job_id then
          print("terminal job id: " .. vim.b.terminal_job_id)
        end
      end

      vim.keymap.set(
        "n",
        "<leader>cM",
        mark_terminal,
        { desc = "Mark terminal job id" }
      )
    end,

    keys = {
      { "<leader><cr>", vim.fn["slime#send_cell"], desc = "Send code chunk" },
      { "<c-cr>", vim.fn["slime#send_cell"], desc = "Send code chunk" },
      {
        "<c-cr>",
        vim.fn["slime#send_cell"],
        mode = "i",
        desc = "Send code chunk",
      },
      {
        "<c-cr>",
        ":SlimeSend<cr>",
        mode = "v",
        desc = "Send code chunk",
      },
      {
        "<cr>",
        ":SlimeSend<cr>",
        mode = "v",
        desc = "Send code chunk",
      },
    },
  },
}
