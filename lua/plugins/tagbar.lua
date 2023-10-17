return {
    { 'preservim/tagbar',
        dependencies = { 'folke/which-key.nvim' },
        init = function()
            vim.g.tagbar_position = 'left'
            vim.g.tagbar_sort = 0
        end,
        config = function()
            local wk = require('which-key')
            wk.register({
                ['<F2>'] = { ':TagbarToggle<CR>', 'Toggle tagbar' }
            }, { silent = true })
        end
    }
}
