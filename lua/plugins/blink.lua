return {
    { 'saghen/blink.cmp',
        version = '1.*', -- use a release so lazy fetches a prebuilt binary instead of compiling
        opts = {
            keymap = {
                preset = 'none',
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
                ['<C-c>'] = { 'accept', 'fallback' },
                ['<C-Space>'] = { 'show', 'fallback' },
                ['<C-e>'] = { 'hide', 'fallback' },
                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            },
            completion = {
                documentation = { auto_show = true },
            },
            signature = { enabled = true }, -- replaces lsp_signature.nvim
            sources = {
                default = { 'lsp', 'path', 'buffer' },
            },
            cmdline = { enabled = true },
        },
    },
}
