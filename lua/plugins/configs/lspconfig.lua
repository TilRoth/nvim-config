local wk = require('which-key')
local diag = vim.diagnostic
local buf = vim.lsp.buf

-- Mappings. See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }

wk.register({
    ['?'] = { function() diag.open_float() end, 'Show diagnostic under cursor' },
    ['[d'] = { function() diag.goto_prev() end, 'Goto previous diagnostic' },
    [']d'] = { function() diag.goto_next() end, 'Goto next diagnostic' },
    ['<leader>e'] = { function() diag.setloclist() end, 'Show all diagnostics' }
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    if client.server_capabilities.goto_definition == true then
        vim.api.nvim_buf_set_option(bufnr, "tagfunc", 'v:lua.vim.lsp.tagfunc')
    end

    if client.server_capabilities.document_formatting == true then
        vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
    end

    -- Mappings. See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    wk.register({
        name = 'LSP',
        h = { function() buf.signature_help() end, 'Show signature help' },
        x = { function() buf.references() end, 'Show references' },
        r = { function() buf.rename() end, 'Refactor rename item under cursor' },
        a = { function() buf.code_action() end, 'Perform code action for item under cursor' },
        f = { function() buf.formatting() end, 'Perform formatting (whole file)' },
        ['<tab>'] = { '<cmd>ClangdSwitchSourceHeader<cr>', 'Switch between source/header file' },
        ['s<tab>'] = { '<cmd>split<cr><cmd>ClangdSwitchSourceHeader<cr>', 'Open source/header file in horizontal split' },
        ['v<tab>'] = { '<cmd>vsplit<cr><cmd>ClangdSwitchSourceHeader<cr>', 'Open source/header file in vertical split' },
    }, { prefix = '<leader>l', buffer = bufnr })

    wk.register({
        d = { function() buf.declaration() end, 'Goto declaration' },
        D = { function() buf.definition() end, 'Goto definition' },
        i = { function() buf.implementation() end, 'Goto implementation' },
        t = { function() buf.type_definition() end, 'Goto type definition' },
    }, { prefix = 'g' } )

    wk.register({
        K = { function() buf.hover() end, 'Tooltip for item under cursor' },
    })
end

local capabilities = require'cmp_nvim_lsp'.default_capabilities()

require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig')['ltex'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig')['texlab'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig')['bashls'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig')['lua_ls'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
}
