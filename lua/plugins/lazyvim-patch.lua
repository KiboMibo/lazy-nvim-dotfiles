if true then
  return {}
end

return {
  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = {
          headline_highlights = {},
          -- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
          bullets = {},
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end

      opts["quarto"] = {
        query = vim.treesitter.query.parse(
          "markdown",
          [[
                  (atx_heading [
                      (atx_h1_marker)
                      (atx_h2_marker)
                      (atx_h3_marker)
                      (atx_h4_marker)
                      (atx_h5_marker)
                      (atx_h6_marker)
                  ] @headline)

                  (thematic_break) @dash

                  (fenced_code_block) @codeblock
                  (minus_metadata) @codeblock

                  (block_quote_marker) @quote
                  (block_quote (paragraph (inline (block_continuation) @quote)))
                  (block_quote (paragraph (block_continuation) @quote))
                  (block_quote (block_continuation) @quote)
              ]]
        ),
        treesitter_language = "markdown",
        headline_highlights = { "Headline" },
        bullet_highlights = {
          "@text.title.1.marker.markdown",
          "@text.title.2.marker.markdown",
          "@text.title.3.marker.markdown",
          "@text.title.4.marker.markdown",
          "@text.title.5.marker.markdown",
          "@text.title.6.marker.markdown",
        },
        bullets = {},
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        dash_string = "-",
        quote_highlight = "Quote",
        quote_string = "┃",
        fat_headlines = true,
        fat_headline_upper_string = "▃",
        fat_headline_lower_string = "🬂",
      }

      for i = 1, 6 do
        local hl = "Headline" .. i
        vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
        table.insert(opts["quarto"].headline_highlights, hl)
      end

      return opts
    end,
    ft = { "markdown", "norg", "rmd", "quarto", "org" },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)
    end,
  },
}
