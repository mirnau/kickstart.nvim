--[[
=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

Kickstart Guide:

  INFO: To refresh the basics on how to use, run the command `:Tutor` in Neovim.

--]] -- INFO: VIM SETTINGS
require('custom.config.globals')
require('custom.config.options')
require('custom.config.keymaps')
require('custom.config.autocmds')

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system {'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath}
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
-- NOTE: Here is where you install your plugins.

require('lazy').setup(
  { -- NOTE: Plugins can be added via a link or github org/name. To run setup automatically, use `opts = {}`
    {
      'NMAC427/guess-indent.nvim',
      opts = {}
    }, 

    require 'custom.plugins.gitsigns', 
    require 'custom.plugins.whichkey', 
    require 'custom.plugins.telescope',
    require 'custom.plugins.lsp',
    require 'custom.plugins.cmp',
    require 'custom.plugins.color-scheme', 
    require 'custom.plugins.todo-comments',
    require 'custom.plugins.mini',
    require 'custom.plugins.treesitter',
    require 'custom.plugins.dashboard',
    require 'custom.plugins.debugging',
    require 'custom.plugins.dap',
    require 'kickstart.plugins.debug',
    require 'kickstart.plugins.indent_line',
    require 'kickstart.plugins.lint',
    require 'kickstart.plugins.autopairs', 
    require 'kickstart.plugins.neo-tree', 
    require 'kickstart.plugins.gitsigns' 

  }, { ---@diagnostic disable-line: missing-fields
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = '⌘',
        config = '🛠',
        event = '📅',
        ft = '📂',
        init = '⚙',
        keys = '🗝',
        plugin = '🔌',
        runtime = '💻',
        require = '🌙',
        source = '📄',
        start = '🚀',
        task = '📌',
        lazy = '💤 '
      }
    }
  })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et