return {
  -- add base16 colorschemes
  {
    "RRethy/nvim-base16",
    priority = 500,
  },

  -- tairiki scheme
  {
    "deparr/tairiki.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tairiki").setup({
        -- optional configuration here
      })
      require("tairiki").load()
    end,
  },

  -- Configure LazyVim to load tomorrow-night
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tairiki",
    },
  },
}
