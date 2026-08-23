return {
    { 'folke/persistence.nvim',
        event = 'BufReadPre',
        opts = {},
        init = function()
            -- Reproduces neovim-session-manager's AutoloadMode.CurrentDir: restore the
            -- session for this directory when nvim is started without file arguments.
            vim.api.nvim_create_autocmd('VimEnter', {
                group = vim.api.nvim_create_augroup('PersistenceAutoload', {}),
                nested = true,
                callback = function()
                    if vim.fn.argc() == 0 then
                        require('persistence').load()
                    end
                end,
            })
        end,
    },
}
