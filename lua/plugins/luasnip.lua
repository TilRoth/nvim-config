return {
    { "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependency = {'folke/which-key.nvim'},
        config = function()
            local ls = require('luasnip')
            local wk = require('which-key')
            wk.register({
                ['<C-l>'] = {function() ls.jump( 1) end, 'jump forward in snippet'},
                ['<C-h>'] = {function() ls.jump(-1) end, 'jump backward in snippet'},
            }, { mode = {'i', 's'}, silent = true })
        end
    }
}
