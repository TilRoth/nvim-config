return {
    { 'simrat39/rust-tools.nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
        config = function()
            local rt = require('rust-tools')
            rt.setup{}
        end,
    },
}
