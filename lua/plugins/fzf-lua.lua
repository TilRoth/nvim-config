return {
    { 'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/which-key.nvim' },
        config = function()
            local fzf = require('fzf-lua')
            fzf.setup{
                winopts = {
                    height = 0.80,
                    width = 0.87,
                    preview = { horizontal = 'right:45%' },
                },
            }
            fzf.register_ui_select() -- replaces telescope-ui-select

            -- Under <leader>, not a bare `f`: which-key v3 will not auto-create a
            -- trigger for a key with a builtin mapping, so `f` had to wait out
            -- timeoutlen before falling through to find-char -- both keys only
            -- registered if they landed inside that 300ms window.
            local wk = require('which-key')
            wk.add({
              { silent = true,
                { '<leader>f', group = 'find' },
                { '<leader>ff', fzf.files, desc = 'Find file' },
                { '<leader>f/', fzf.live_grep, desc = 'grep in directory' },
                { '<leader>fb', fzf.lgrep_curbuf, desc = 'grep in buffer' },
                { '<leader>fs', fzf.lsp_live_workspace_symbols, desc = 'Find symbols' },
                { '<leader>fd', fzf.diagnostics_workspace, desc = 'Search diagnostics' },

                { '<leader>fg', group = 'git' },
                { '<leader>fgf', fzf.git_files, desc = 'Find file tracked in Git' },
                { '<leader>fgb', fzf.git_branches, desc = 'Find Git branch' },
                { '<leader>fgc', fzf.git_commits, desc = 'Find Git commit' },
                { '<leader>fgh', fzf.git_bcommits, desc = "Find buffer's Git commit (history)" },
              },
            })
        end
    },
}
