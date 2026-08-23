return {
    { 'mason-org/mason.nvim',
        opts = {},
    },
    { 'mason-org/mason-lspconfig.nvim',
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
            'saghen/blink.cmp',
        },
        opts = {
            -- Only what is actually used. Add servers here as they are needed;
            -- mason-lspconfig v2 enables whatever it installs.
            ensure_installed = { 'clangd' },
        },
    },
    { 'neovim/nvim-lspconfig',
        dependencies = {
            'folke/which-key.nvim',
            'folke/trouble.nvim',
            'saghen/blink.cmp',
        },
        config = function()
            local wk = require('which-key')

            -- Server configuration, Neovim 0.11 native. These must run before
            -- mason-lspconfig enables anything.
            vim.lsp.config('*', {
                capabilities = require('blink.cmp').get_lsp_capabilities(),
            })

            vim.diagnostic.config({
                severity_sort = true,
                float = { border = 'rounded', source = true },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '\u{f057}',
                        [vim.diagnostic.severity.WARN]  = '\u{f071}',
                        [vim.diagnostic.severity.INFO]  = '\u{f05a}',
                        [vim.diagnostic.severity.HINT]  = '\u{f0eb}',
                    },
                },
            })

            -- Global mappings.
            local diag = vim.diagnostic
            wk.add({
                { '?', diag.open_float, desc = 'Show diagnostic under cursor' },
                { '[d', function() diag.jump({ count = -1, float = true }) end, desc = 'Goto previous diagnostic' },
                { ']d', function() diag.jump({ count = 1, float = true }) end, desc = 'Goto next diagnostic' },
                { '<leader>e', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Show all diagnostics' },
            })

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local buf = vim.lsp.buf
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)

                    wk.add({
                        { '<leader>l', group = 'LSP', buffer = ev.buf },
                        { '<leader>lh', buf.signature_help, desc = 'Show signature help', buffer = ev.buf },
                        { '<leader>lx', '<cmd>Trouble lsp_references toggle<cr>', desc = 'Show references', buffer = ev.buf },
                        { '<leader>lr', buf.rename, desc = 'Refactor rename item under cursor', buffer = ev.buf },
                        { '<leader>la', buf.code_action, desc = 'Perform code action for item under cursor', buffer = ev.buf },
                        { '<leader>lf', function() buf.format { async = true } end, desc = 'Perform formatting (whole file)', buffer = ev.buf },

                        { 'gD', buf.declaration, desc = 'Goto declaration', buffer = ev.buf },
                        { 'gd', buf.definition, desc = 'Goto definition', buffer = ev.buf },
                        { 'gi', buf.implementation, desc = 'Goto implementation', buffer = ev.buf },
                        { 'K', buf.hover, desc = 'Tooltip for item under cursor', buffer = ev.buf },
                    })

                    if client and client:supports_method('textDocument/inlayHint') then
                        vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
                    end

                    if client and client.name == 'clangd' then
                        wk.add({
                            { '<leader>l<tab>', '<cmd>LspClangdSwitchSourceHeader<cr>', desc = 'Switch between source/header file', buffer = ev.buf },
                            { '<leader>ls<tab>', '<cmd>split<cr><cmd>LspClangdSwitchSourceHeader<cr>', desc = 'Open source/header file in horizontal split', buffer = ev.buf },
                            { '<leader>lv<tab>', '<cmd>vsplit<cr><cmd>LspClangdSwitchSourceHeader<cr>', desc = 'Open source/header file in vertical split', buffer = ev.buf },
                        })
                    end
                end,
            })
        end
    },
}
