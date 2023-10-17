return {
    { 'lervag/vimtex',
        dependencies = {'folke/which-key.nvim'},
        init = function()
            vim.g.tex_flavor = 'latex'
            vim.g.vimtex_compiler_method = 'latexmk'
        end,
        config = function()
            local wk = require('which-key')
            wk.register({
            name = 'LaTex',
                v = { '<cmd>VimtexView<cr>', 'View document' },
                l = { '<cmd>VimtexCompile<cr>', 'Compile' },
                c = { '<cmd>VimtexClean<cr>', 'Clean' },
                e = { '<cmd>VimtexErrors<cr>', 'Show Errors' },
                i = { '<cmd>VimtexInfo<cr>', 'Info' },
                t = { '<cmd>VimtexTocOpen<cr>', 'Table of contens' },
                T = { '<cmd>VimtexTocToggle<cr>', 'Table of contens toggle' },
            }, { prefix = '<leader>v' })
        end

    }
}
