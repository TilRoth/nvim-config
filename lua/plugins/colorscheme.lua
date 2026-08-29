return {
    { 'sainnhe/everforest',
        priority = 1000,
        config = function()
            vim.g.everforest_diagnostic_virtual_text = 'colored'
        end
    },
    {
        -- `name` because the repo is rose-pine/neovim, which would otherwise
        -- install into a directory called `neovim`.
        "rose-pine/neovim",
        name = "rose-pine",
        -- The main colorscheme must load before any other start plugin: plugins
        -- that build highlight groups in setup() otherwise derive them from the
        -- default colorscheme, and only recover if they watch ColorScheme.
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('rose-pine')
        end
    }
}
