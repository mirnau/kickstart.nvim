return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')

      -- Core execution
      vim.keymap.set('n', '<F5>', dap.continue)
      vim.keymap.set('n', '<F4>', dap.terminate)
      vim.keymap.set('n', '<F6>', dap.run_last)

      -- Stepping
      vim.keymap.set('n', '<F10>', dap.step_over)
      vim.keymap.set('n', '<F11>', dap.step_into)
      vim.keymap.set('n', '<F12>', dap.step_out)

      -- Breakpoints
      vim.keymap.set('n', '<F9>', dap.toggle_breakpoint)
      vim.keymap.set('n', '<F7>', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end)

      -- Optional
      vim.keymap.set('n', '<F8>', dap.repl.open)
    end,
  },

  require('custom.plugins.dap.cpp'),
  require('custom.plugins.dap.cs'),
  require('custom.plugins.dap.ui'),
}