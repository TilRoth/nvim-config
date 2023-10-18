return {
    { 'lervag/vimtex',
        init = function()
            vim.g.tex_flavor = 'latex'
            vim.g.vimtex_compiler_method = 'latexmk'
        end
    }
}
