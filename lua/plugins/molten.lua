return {
    { "benlubas/molten-nvim",
        dependencies = { "3rd/image.nvim", "folke/which-key.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_auto_open_output = false
        end,
        config = function()
            local wk = require('which-key')
            wk.register({
                name = "Molten",
                d = {":MoltenDelete<CR>", "Delete cell"},
                e = {":MoltenEvaluateLine<CR>", "Evaluate line"},
                r = {":MoltenReevaluateCell<CR>", "Reevaluate cell"},
                o = {":MoltenEvaluateOperator<CR>", "Operator selection"},
                s = {":noautocmd MoltenEnterOutput<CR>", "Show/enter output"},
            }, { prefix = '<leader>m', silent = true })

            wk.register({
                name = "Molten",
                e = {":<C-u>MoltenEvaluateVisual<CR>", "evaluate visual"},
            }, { prefix = '<leader>m', silent = true, mode = 'v' })
        end
    },
    { "3rd/image.nvim",
        opts = {
            backend = "ueberzug",
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
    },
}
