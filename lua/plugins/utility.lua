return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.trailspace').setup( -- trailspace removal
        {
          -- Highlight only in normal buffefs (ones with empty 'buftype'). This is
          -- useful to not show trailing whitespace where it usually doesn't matter.
          only_in_normal_buffers = false,
        })
    end,
    init = function()
      vim.cmd('au FileType dashboard lua vim.b.minitrailspace_disable = true')
    end
  },
}
