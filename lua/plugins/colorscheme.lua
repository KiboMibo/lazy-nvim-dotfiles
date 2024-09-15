return {
  -- add base16 colorschemes
  -- {
  --   "RRethy/nvim-base16",
  --   priority = 500,
  -- },

  -- tairiki scheme
  -- {
  --   "deparr/tairiki.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tairiki").setup({
  --       -- optional configuration here
  --       transparent = true, -- Show/hide background
  --     })
  --     require("tairiki").load() -- only necessary to use as default theme, has same behavior as ':colorscheme tairiki'
  --   end,
  -- },

  -- github themes
  -- {
  --   'projekt0n/github-nvim-theme',
  --   -- lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   -- priority = 1000, -- make sure to load this before all the other start plugins
  -- },

  {
    "HoNamDuong/hybrid.nvim",
    lazy = true,
    priority = 1000,

    config = function()
      require("hybrid").setup({
        transparent = true, -- Show/hide background
        overrides = function(hl, c)
          hl["@markup.heading.1"] = { fg = c.bright_yellow, bold = true }
          hl["@markup.heading.2"] = { fg = c.bright_cyan, bold = true }
          hl["@markup.heading.3"] = { fg = c.bright_green, bold = true }
          hl["@markup.heading.4"] = { fg = c.yellow }
          hl["@markup.heading.5"] = { fg = c.cyan }
          hl["@markup.heading.6"] = { fg = c.green }
          hl["@markup.raw"] = {}
          hl["@markup.raw.block"] = { fg = c.green }
        end,
      })
    end,
  },

  -- Configure LazyVim to load tomorrow-night
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "hybrid",
    },
  },

  -- fix nvim-notify colors
  {
    "rcarriga/nvim-notify",
    -- dependencies = {
    --   { "HoNamDuong/hybrid.nvim" },
    -- },
    opts = function(_, opts)
      local bg_color = require("hybrid.colors").palette.yellow
      opts.background_colour = bg_color
    end,
  },
}
