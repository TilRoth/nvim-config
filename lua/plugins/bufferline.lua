return {
    { 'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup{
                options = {
                    mode = 'tabs',
                    diagnostics = 'nvim_lsp',
                    numbers = 'ordinal'
                }
            }
        end
    }
}

