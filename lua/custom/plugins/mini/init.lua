return {
  'nvim-mini/mini.nvim',

  config = function()
    require('custom.plugins.mini.ai')
    require('custom.plugins.mini.surround')
    require('custom.plugins.mini.statusline')
  end,
}