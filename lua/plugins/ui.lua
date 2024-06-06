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
      sections = {
        lualine_z = {
          function()
            return "󰔟 " .. os.date("%I:%M %p")
          end,
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
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
