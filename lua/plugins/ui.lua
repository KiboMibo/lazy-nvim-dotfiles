return {
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "wrapped-compact",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = "",
        component_separators = "",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      window = {
        mappings = {
          ["="] = "cd_root",
        },
      },
      commands = {
        cd_root = function(state)
          local path = state.path -- this gives you the path

          -- do whatever you want to do here
          vim.fn.chdir(path)
        end,
      },
    },
  },
}
