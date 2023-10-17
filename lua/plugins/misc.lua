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
            require('ibl').setup()
        end
    }
}
