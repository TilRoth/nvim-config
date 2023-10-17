return {
    { 'scrooloose/nerdcommenter',
        dependencies = {'folke/which-key.nvim'},
        init = function()
            vim.g.NERDCreateDefaultMappings = 0
            vim.g.NERDAllowAnyVisualDelims = 1
            vim.g.NERDSpaceDelims = 1
            vim.g.NERDCompactSexyComs = 1
            vim.g.NERDTrimTrailingWhitespace = 1
            vim.g.NERDDefaultAlign = 'left'
        end,
        config = function()
            local wk = require('which-key')
            wk.register({
                ['<C-c>'] = { ":call nerdcommenter#Comment('n', 'toggle')<CR>", 'comment out'}
            }, {silent = true})
            wk.register({
                ['<C-c>'] = { ":call nerdcommenter#Comment('x', 'toggle')<CR>", 'comment out'}
            }, {silent = true, mode = 'v'})
        end
    }
}
