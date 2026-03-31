return {
    'akinsho/toggleterm.nvim',
    opts = {
        direction = 'float',
        shell = 'powershell',
        float_opts = {
            border = 'rounded',
            width = 80,
            height = 25
        },
        on_open = function(term)
            vim.cmd('startinsert')

            vim.keymap.set('t', '<Esc>', function()
                vim.cmd('stopinsert')
                vim.cmd('close')
            end, {
                buffer = term.bufnr,
                silent = true,
                desc = 'Close floating terminal',
            })
        end,
    },
    config = function(_, opts)
        require('toggleterm').setup(opts)

        vim.keymap.set('n', '<leader>c', '<cmd>ToggleTerm<CR>', {
            desc = 'Toggle floating terminal'
        })
    end
}

