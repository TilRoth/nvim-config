return {
    { 'ray-x/lsp_signature.nvim',
        config = function()
            require'lsp_signature'.setup{
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                handler_opts = { border = 'rounded' },
            }
        end
    },
    { 'williamboman/mason.nvim',
        config = function()
            require('mason').setup{}
        end
    },
    { 'williamboman/mason-lspconfig.nvim',
        dependencies = {'williamboman/mason.nvim'},
        config = function()
            require('mason-lspconfig').setup {
                ensure_installed = {
                    'pyright',
                    'rust_analyzer',
                    'lua_ls',
                    'bashls',
                    'texlab',
                    'ltex',
                    'clangd',
                },
            }
        end
    },
    { 'p00f/clangd_extensions.nvim' },
    { 'barreiroleo/ltex_extra.nvim' },
    { 'neovim/nvim-lspconfig',
        dependencies = {
            'folke/which-key.nvim',
            'p00f/clangd_extensions.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'barreiroleo/ltex_extra.nvim',
        },
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.pyright.setup{
                capabilities = capabilities
            }
            lspconfig.rust_analyzer.setup{
                capabilities = capabilities
            }
            lspconfig.lua_ls.setup{
                capabilities = capabilities
            }
            lspconfig.bashls.setup{
                capabilities = capabilities
            }
            lspconfig.texlab.setup{
                capabilities = capabilities
            }
            lspconfig.ltex.setup{
                capabilities = capabilities,
                on_attach = function()
                    require('ltex_extra').setup{}
                end
            }
            lspconfig.clangd.setup{
                on_attach = function()
                    require("clangd_extensions.inlay_hints").setup_autocmd()
                    require("clangd_extensions.inlay_hints").set_inlay_hints()
                end,
                capabilities = capabilities
            }

            local wk = require('which-key')
            local diag = vim.diagnostic

            -- Global mappings.
            wk.register({
                ['?'] = { diag.open_float, 'Show diagnostic under cursor' },
                ['[d'] = { diag.goto_prev, 'Goto previous diagnostic' },
                [']d'] = { diag.goto_next, 'Goto next diagnostic' },
                ['<leader>e'] = { diag.setloclist, 'Show all diagnostics' }
            })

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Buffer local mappings.
                    local buf = vim.lsp.buf
                    wk.register({
                        name = 'LSP',
                        h = { buf.signature_help, 'Show signature help' },
                        x = { buf.references, 'Show references' },
                        r = { buf.rename, 'Refactor rename item under cursor' },
                        a = { buf.code_action, 'Perform code action for item under cursor' },
                        f = { function() buf.format {async=true} end, 'Perform formatting (whole file)' },
                    }, { prefix = '<leader>l', buffer = ev.buf })

                    wk.register({
                        gD = { buf.declaration, 'Goto declaration' },
                        gd = { buf.definition, 'Goto definition' },
                        gi = { buf.implementation, 'Goto implementation' },
                        K = { buf.hover, 'Tooltip for item under cursor' },
                        ['<C-k>'] = { buf.signature_help, 'Signature help' },
                    }, { buffer = ev.buf })
                end,
            })
        end
    }
}
