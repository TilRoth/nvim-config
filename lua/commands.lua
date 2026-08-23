local vim = vim
vim.api.nvim_create_user_command(
    'LspDisableHighlight',
    function()
        for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
          vim.api.nvim_set_hl(0, group, {})
        end
    end,
    { desc = 'Disable semantic token highlighting' }
)

vim.api.nvim_create_user_command(
    'Q',
    function()
        vim.cmd [[qa]]
    end,
    { desc = 'Close all windows' }
)

-- Markdown highlighting without nvim-treesitter: Neovim bundles the markdown and
-- markdown_inline parsers *and* their queries in /usr/lib/nvim/parser/.
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function() pcall(vim.treesitter.start) end,
    desc = 'Enable treesitter highlighting for markdown',
})

-- Prose buffers should wrap instead of being held to the global 120 column limit.
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown', 'text' },
    callback = function()
        vim.opt_local.textwidth = 0
        vim.opt_local.colorcolumn = ''
        vim.opt_local.wrap = true
    end,
    desc = 'Soft wrap prose, no colorcolumn',
})
