-- Plugin configuration
return {
  {
    "tris203/precognition.nvim",
    event = "LazyFile",
    opts = {
      startVisible = true,
      showBlankVirtLine = false,
    },
    keys = {
      {
        "<leader>u?",
        "<cmd>Precognition toggle<cr>",
        desc = "Toggle Precognition",
      },
    },
  },
}
