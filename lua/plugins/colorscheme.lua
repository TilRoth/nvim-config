return {
    { 'sainnhe/everforest',
        priority = 1000,
        config = function()
            vim.g.everforest_diagnostic_virtual_text = 'colored'
            vim.cmd 'colorscheme everforest'
        end
    },
}
