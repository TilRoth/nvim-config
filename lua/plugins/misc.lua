return {
    { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
    { 'nvim-tree/nvim-web-devicons' },
    { 'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    { 'iamcco/markdown-preview.nvim',
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    { 'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup{
                indent = {
                    char = '▏'
                }
            }
        end
    },
    { 'j-hui/fidget.nvim',
        opts = { },
    },
    { 'simrat39/symbols-outline.nvim',
        dependencies = { 'folke/which-key.nvim' },
        config = function()
            local symbol_outline = require('symbols-outline')
            local wk = require('which-key')
            symbol_outline.setup()
            wk.register({
                s = { '<cmd>SymbolsOutline<cr>', 'SymbolsOutline' }
            }, { prefix = '<leader>n', silent = true })
        end
    },
}
