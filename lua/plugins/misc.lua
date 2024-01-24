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
    { 'hedyhli/outline.nvim',
        dependencies = { 'folke/which-key.nvim' },
        config = function()
            local outline = require('outline')
            local wk = require('which-key')
            outline.setup()
            wk.register({
                s = { '<cmd>Outline<cr>', 'Toggle outline' }
            }, { prefix = '<leader>n', silent = true })
        end,
    },
    { 'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            auto_preview = false,
        },
    },
    { 'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings(true)
        end
    },
    { 'kylechui/nvim-surround',
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    }
}
