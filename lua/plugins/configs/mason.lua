require('mason').setup()
require("mason-nvim-dap").setup({
    ensure_installed = { 'codelldb', 'debugpy' },
})
require("mason-lspconfig").setup {
    ensure_installed = {},
    automatic_installation = true,
}
