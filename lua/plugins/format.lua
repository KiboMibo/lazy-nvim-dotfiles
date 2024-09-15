return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- r formatter
        ["markdown"] = { "prettierd" },
        ["markdown.mdx"] = { "prettierd" },
        ["quarto"] = { "prettierd" },
        ["rmd"] = { "prettierd" },
        ["r"] = { "mystyler" },
        ["*"] = { "trim_whitespace", "trim_newlines" },
      },
      formatters = {
        prettier = {
          options = {
            ft_parsers = {
              quarto = "markdown",
              rmd = "markdown",
            },
          },
        },
        mystyler = {
          command = "R",
          args = {
            "-s",
            "-e",
            "styler::style_file(commandArgs(TRUE)[1])",
            "--args",
            "$FILENAME",
          },
          stdin = false,
        },
        injected = {
          -- Set the options field
          options = {
            -- Set to true to ignore errors
            ignore_errors = false,
            -- Map of treesitter language to file extension
            -- A temporary file name with this extension will be generated during formatting
            -- because some formatters care about the filename.
            lang_to_ext = {
              bash = "sh",
              c_sharp = "cs",
              elixir = "exs",
              javascript = "js",
              julia = "jl",
              latex = "tex",
              markdown = "md",
              python = "py",
              ruby = "rb",
              rust = "rs",
              teal = "tl",
              r = "r",
              typescript = "ts",
            },
            -- Map of treesitter language to formatters to use
            -- (defaults to the value from formatters_by_ft)
            lang_to_formatters = {
              ["r"] = { "mystyler" },
            },
          },
        },
      },
      log_level = vim.log.levels.DEBUG,
    },
  },
}
