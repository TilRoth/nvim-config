local wk = require('which-key')
local vim = vim
require('gitsigns').setup{
    sign_priority = 15,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        wk.register({
            ['[h'] = { function() gs.prev_hunk() end, 'Goto previous hunk' },
            [']h'] = { function() gs.next_hunk() end, 'Goto next hunk' },
        }, { buffer = bufnr })

        wk.register({
            name = 'git',
            s = { '<cmd>Gitsigns stage_hunk<CR>', 'Stage hunk' },
            r = { '<cmd>Gitsigns reset_hunk<CR>', 'Reset hunk' },
            S = { gs.stage_buffer, 'Stage buffer' },
            R = { gs.reset_buffer, 'Reset buffer' },
            u = { gs.undo_stage_hunk, 'Unstage hunk' },
            p = { gs.preview_hunk, 'Preview hunk' },
            b = { function() gs.blame_line{full=true} end, 'Blame line' },
            d = { gs.diffthis, 'Diff' },
        }, { prefix = '<leader>g', buffer = bufnr })
    end
}
