return {
    { 'folke/persistence.nvim',
        -- Deliberately not loaded by an event. persistence.setup() arms a
        -- VimLeavePre save the moment it loads, so loading on BufReadPre meant
        -- `nvim one-file.cpp` in a project directory would, on exit, overwrite
        -- that directory's session with just that one file. Requiring it only
        -- from the autocmd below keeps saving tied to session launches.
        lazy = true,
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
