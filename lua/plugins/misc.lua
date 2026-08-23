return {
    { 'nvim-tree/nvim-web-devicons' },
    { 'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    { 'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            auto_preview = false,
        },
    },
}
