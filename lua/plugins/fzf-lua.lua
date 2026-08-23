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

            local wk = require('which-key')
            wk.add({
              { silent = true,
                { 'f', group = 'find' },
                { 'ff', fzf.files, desc = 'Find file' },
                { 'f/', fzf.live_grep, desc = 'grep in directory' },
                { 'fb', fzf.lgrep_curbuf, desc = 'fuzzy find in buffer' },
                { 'fs', fzf.lsp_live_workspace_symbols, desc = 'Find symbols' },
                { 'fd', fzf.diagnostics_workspace, desc = 'Search diagnostics' },

                { 'fg', group = 'git' },
                { 'fgf', fzf.git_files, desc = 'Find file tracked in Git' },
                { 'fgb', fzf.git_branches, desc = 'Find Git branch' },
                { 'fgc', fzf.git_commits, desc = 'Find Git commit' },
                { 'fgh', fzf.git_bcommits, desc = "Find buffer's Git commit (history)" },
              },
            })
        end
    },
}
