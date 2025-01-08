return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "yaml-language-server",
        "json-lsp",
        -- "texlab",
        -- "pyright",
        -- "mdformat",
        -- "markdownlint-cli2",
        -- "typos",
        "prettierd",
        "black",
        -- "nil",
        -- "cbfmt",
        -- "codespell"
        "gopls",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          mason = false,
        },
        nil_ls = {
          mason = false,
        },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        quarto = { "markdownlint-cli2" },
        rmd = { "markdownlint-cli2" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
        "markdown",
        "markdown_inline",
        "julia",
        "bash",
        "yaml",
        "lua",
        "vim",
        "query",
        "vimdoc",
        "latex",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "luadoc",
        "luap",
        "regex",
        "tsx",
        "nix",
      },
    },
  },
}
