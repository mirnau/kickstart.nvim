return {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
        styles = {
            comments = {
                italic = false
            }
        }
    },

    config = function()
        vim.cmd.colorscheme 'tokyonight-night'
    end
}
