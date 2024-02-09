return {
  -- add base16 colorschemes
  {
    "RRethy/nvim-base16",
    priority = 500,
  },

  -- Configure LazyVim to load tomorrow-night
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "base16-tomorrow-night",
    },
  },
}
