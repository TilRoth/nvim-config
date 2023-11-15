return {
    { 'SmiteshP/nvim-navbuddy',
        dependencies = {
            'SmiteshP/nvim-navic',
            'MunifTanjim/nui.nvim',
            'numToStr/Comment.nvim',
            'nvim-telescope/telescope.nvim',
            'folke/which-key.nvim'
        },
        config = function()
            local navbuddy = require('nvim-navbuddy')
            local wk = require('which-key')
            navbuddy.setup{
                lsp = { auto_attach = true }
            }
            wk.register({
                name = 'Navigation',
                n = { '<cmd>Navbuddy<cr>', 'Navbuddy' }
            }, { prefix = '<leader>n', silent = true })
        end
    }
}
