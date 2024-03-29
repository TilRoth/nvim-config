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
