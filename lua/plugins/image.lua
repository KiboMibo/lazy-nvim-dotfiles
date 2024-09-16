return { -- show images in nvim!
  "3rd/image.nvim",
  enabled = true,
  -- fix to commit to keep using the rockspeck for image magick
  -- TODO: check back on this later
  -- commit = "deb158d",
  dev = false,
  ft = { "markdown", "quarto", "vimwiki", "rmd" },
  config = function()
    -- Requirements
    -- https://github.com/3rd/image.nvim?tab=readme-ov-file#requirements
    -- check for dependencies with `:checkhealth kickstart`
    -- needs:
    -- sudo apt install imagemagick
    -- sudo apt install libmagickwand-dev
    -- sudo apt install liblua5.1-0-dev
    -- sudo apt install lua5.1
    -- sudo apt installl luajit

    local image = require("image")
    image.setup({
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          only_render_image_at_cursor = true,
          filetypes = { "markdown", "vimwiki", "quarto", "rmd" },
        },
      },
      editor_only_render_when_focused = false,
      window_overlap_clear_enabled = true,
      tmux_show_only_in_active_window = true,
      window_overlap_clear_ft_ignore = {
        "cmp_menu",
        "cmp_docs",
        "scrollview",
        "scrollview_sign",
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 60,
      kitty_method = "normal",
    })
  end,
}
