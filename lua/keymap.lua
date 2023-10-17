local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local vim = vim
local wk = require('which-key')
vim.api.nvim_create_autocmd('TabLeave', { command = 'let g:lasttab = tabpagenr()' })

-- normal mode
wk.register({
    ['<C-h>'] = {'<C-w>h', 'Move to left window'},
    ['<C-j>'] = {'<C-w>j', 'Move to window below'},
    ['<C-k>'] = {'<C-w>k', 'Move to window above'},
    ['<C-l>'] = {'<C-w>l', 'Move to right window'},

    ['<C-Up>'] = {':resize +2<CR>', 'resize up'},
    ['<C-Down>'] = {':resize -2<CR>', 'resize down'},
    ['<C-Left>'] = {':vertical resize -2<CR>', 'resize left'},
    ['<C-Right>'] = {':vertical resize +2<CR>', 'resize right'},

    ['<leader>s'] = { '<cmd>update<cr>', 'save file' },
    ['g<Tab>'] = { '<cmd>exe "tabn ".g:lasttab<cr>', 'Switch to previous tab' },
    ['<F6>'] = { function() vim.opt.spell = not vim.o.spell end, 'toggle vim spell' },
    ['<Esc>'] = {':nohlsearch<CR>', 'Stop highlight search'},
    ['<BS>'] = {':%s/\\s\\+$//<CR>:w<CR>', 'Remove trailing whitespaces'},

    ['<leader>p'] = {'"+p', 'paste from clipboard in normal mode'},
}, { silent = true, mode = 'n' })

-- visual mode
wk.register({
    ['<'] = {'<gv', 'stay in indent mode to left'},
    ['>'] = {'>gv', 'stay in indent mode to right'},
    ['<C-s>'] = {':sort i<CR>', 'Sort visual lines'},

    ['<leader>y'] = {'"+y', 'copy to clipboard'},
    ['<leader>p'] = {'"+p', 'paste from clipboard in visual mode'},
}, { silent = true , mode = 'v' })

