return {
    'akinsho/toggleterm.nvim',
    opts = {
        direction = "float",
        float_opts = {
            border = "rounded", -- Options: "single", "double", "rounded", etc.
            width = 80,   -- Adjust width as desired
            height = 25,  -- Adjust height as desired
        },
        shell = "pwsh" -- Use "powershell" if that's your preferred executable
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
    end
}