return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    require('dashboard').setup({
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
          concat = '  Hyper mode',
        },
        shortcut = {
          {
            icon = '󰊳 ',
            icon_hl = 'DashboardShortCutIcon',
            desc = 'Update',
            group = 'Label',
            action = 'Lazy update',
            key = 'u',
          },
          {
            icon = '󰱼 ',
            icon_hl = 'DashboardShortCutIcon',
            desc = 'Files',
            group = 'Directory',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = '󰈞 ',
            icon_hl = 'DashboardShortCutIcon',
            desc = 'Recent',
            group = 'Number',
            action = 'Telescope oldfiles',
            key = 'r',
          },
          {
            icon = '󰒲 ',
            icon_hl = 'DashboardShortCutIcon',
            desc = 'Config',
            group = 'DiagnosticHint',
            action = 'Telescope find_files cwd=' .. vim.fn.stdpath('config'),
            key = 'c',
          },
        },
        packages = { enable = true },
        project = {
          enable = true,
          limit = 8,
          icon = ' ',
          label = ' Projects',
          action = 'Telescope find_files cwd=',
        },
        mru = {
          enable = true,
          limit = 10,
          icon = ' ',
          label = ' Recent files',
          cwd_only = false,
        },
        footer = {},
      },
    })

    vim.api.nvim_set_hl(0, 'DashboardHeader', { link = 'Title' })
    vim.api.nvim_set_hl(0, 'DashboardFooter', { link = 'Comment' })
    vim.api.nvim_set_hl(0, 'DashboardShortCutIcon', { link = 'Keyword' })
  end,
}