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
                    'denols',
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
            'SmiteshP/nvim-navbuddy',
            'folke/trouble.nvim'
        },
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local wk = require('which-key')
            local trouble = require('trouble')
            lspconfig.pyright.setup{
                capabilities = capabilities
            }
            lspconfig.lua_ls.setup{
                capabilities = capabilities
            }
            lspconfig.bashls.setup{
                capabilities = capabilities
            }
            lspconfig.texlab.setup{
                on_attach = function()
                    wk.register({
                    name = 'LaTex',
                        v = { '<cmd>VimtexView<cr>', 'View document' },
                        l = { '<cmd>VimtexCompile<cr>', 'Compile' },
                        c = { '<cmd>VimtexClean<cr>', 'Clean' },
                        e = { '<cmd>VimtexErrors<cr>', 'Show Errors' },
                        i = { '<cmd>VimtexInfo<cr>', 'Info' },
                        t = { '<cmd>VimtexTocOpen<cr>', 'Table of contens' },
                        T = { '<cmd>VimtexTocToggle<cr>', 'Table of contens toggle' },
                    }, { prefix = '<leader>v' })
                end,
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
                    wk.register({
                        ['<tab>'] = { '<cmd>ClangdSwitchSourceHeader<cr>', 'Switch between source/header file' },
                        ['s<tab>'] = { '<cmd>split<cr><cmd>ClangdSwitchSourceHeader<cr>', 'Open source/header file in horizontal split' },
                        ['v<tab>'] = { '<cmd>vsplit<cr><cmd>ClangdSwitchSourceHeader<cr>', 'Open source/header file in vertical split' },
                    }, { prefix = '<leader>l', silent = true })
                end,
                capabilities = capabilities
            }
            lspconfig.denols.setup{
                capabilities = capabilities
            }

            local diag = vim.diagnostic

            -- Global mappings.
            wk.register({
                ['?'] = { diag.open_float, 'Show diagnostic under cursor' },
                ['[d'] = { diag.goto_prev, 'Goto previous diagnostic' },
                [']d'] = { diag.goto_next, 'Goto next diagnostic' },
                ['<leader>e'] = { trouble.toggle, 'Show all diagnostics' }
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
                        x = { function() trouble.toggle('lsp_references') end, 'Show references' },
                        r = { buf.rename, 'Refactor rename item under cursor' },
                        a = { buf.code_action, 'Perform code action for item under cursor' },
                        f = { function() buf.format {async=true} end, 'Perform formatting (whole file)' },
                    }, { prefix = '<leader>l', buffer = ev.buf })

                    wk.register({
                        gD = { buf.declaration, 'Goto declaration' },
                        gd = { buf.definition, 'Goto definition' },
                        gi = { buf.implementation, 'Goto implementation' },
                        K = { buf.hover, 'Tooltip for item under cursor' },
                    }, { buffer = ev.buf })
                end,
            })
        end
    }
}
