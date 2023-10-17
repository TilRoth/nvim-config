return {
    { 'morhetz/gruvbox' },
    { 'sainnhe/everforest',
        priority = 1000,
        config = function()
            vim.g.everforest_diagnostic_virtual_text = 'colored'
            vim.cmd 'colorscheme everforest'
        end
    },
    { 'catppuccin/nvim', name = 'catppuccin' },
    { 'projekt0n/github-nvim-theme' },
    { 'rebelot/kanagawa.nvim' },
    { 'Everblush/nvim', name = 'everblush' },
}

