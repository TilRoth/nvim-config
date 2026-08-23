return {
    { 'lewis6991/gitsigns.nvim',
        dependencies = { 'folke/which-key.nvim' },
        config = function()
            local wk = require('which-key')
            require('gitsigns').setup{
                sign_priority = 15,
                on_attach = function(bufnr)
                    local gs = require('gitsigns')

                    wk.add({
                        { '[h', function() gs.nav_hunk('prev') end, desc = 'Goto previous hunk', buffer = bufnr },
                        { ']h', function() gs.nav_hunk('next') end, desc = 'Goto next hunk', buffer = bufnr },

                        { '<leader>g', group = 'git', buffer = bufnr },
                        { '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>', desc = 'Stage hunk', buffer = bufnr },
                        { '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', desc = 'Reset hunk', buffer = bufnr },
                        { '<leader>gS', gs.stage_buffer, desc = 'Stage buffer', buffer = bufnr },
                        { '<leader>gR', gs.reset_buffer, desc = 'Reset buffer', buffer = bufnr },
                        { '<leader>gu', gs.undo_stage_hunk, desc = 'Unstage hunk', buffer = bufnr },
                        { '<leader>gp', gs.preview_hunk, desc = 'Preview hunk', buffer = bufnr },
                        { '<leader>gb', function() gs.blame_line{ full = true } end, desc = 'Blame line', buffer = bufnr },
                        { '<leader>gd', gs.diffthis, desc = 'Diff', buffer = bufnr },
                    })
                end
            }
        end
    }
}
