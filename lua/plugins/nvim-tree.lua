return {
    { 'nvim-tree/nvim-tree.lua',
        version = "*",
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'folke/which-key.nvim'
        },
        config = function()
            require("nvim-tree").setup {
                view = {
                    side = 'right',
                },
                git = {
                    ignore = false,
                }
            }

            local wk = require('which-key')
            wk.register({
                ['<F3>'] = { ':NvimTreeToggle<CR>', 'Toggle nvim tree' }
            }, { silent = true })
        end,
    }
}
