return {
    { 'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/which-key.nvim' },
        lazy = false, -- oil takes over netrw, so it has to be present at startup
        config = function()
            require('oil').setup{
                view_options = {
                    show_hidden = true,
                },
            }

            require('which-key').add({
                { '<leader>o', function() require('oil').toggle_float() end, desc = 'Toggle file browser', silent = true },
            })
        end,
    },
}
