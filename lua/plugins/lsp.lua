return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "yaml-language-server",
        -- "json-lsp",
        -- "r-languageserver",
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
        clangd = {
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
        "r",
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
        "dot",
        "javascript",
        "mermaid",
        "norg",
        "typescript",
        "c",
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
