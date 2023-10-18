return {
    { 'numToStr/Comment.nvim',
        dependencies = { 'folke/which-key.nvim' },
        config = function()
            local comment = require('Comment')
            local wk = require('which-key')
            comment.setup{
                mappings = {
                    basic = false,
                    extra = false,
                }
            }
            wk.register({
                name = 'Comment',
                c = { '<Plug>(comment_toggle_linewise_current)', 'toggle comment linewise'},
                b = { '<Plug>(comment_toggle_blockwise_current)', 'toggle comment blockwise'},
            }, { prefix = '<leader>c', silent = true })

            wk.register({
                name = 'Comment',
                c = { '<Plug>(comment_toggle_linewise_visual)', 'toggle comment linewise'},
                b = { '<Plug>(comment_toggle_blockwise_visual)', 'toggle comment blockwise'},
            }, { prefix = '<leader>c', silent = true, mode = 'x' })
        end
    }
}
