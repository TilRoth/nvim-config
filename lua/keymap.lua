local vim = vim
local wk = require('which-key')
vim.api.nvim_create_autocmd('TabLeave', { command = 'let g:lasttab = tabpagenr()' })

-- Nested spec: `silent` is an inheritable field, so it applies to every entry below.
-- (which-key v3's second argument is only { version, create, notify } and would ignore it.)
wk.add({
  { silent = true,
    -- normal mode
    { '<C-Up>', ':resize +2<CR>', desc = 'resize up' },
    { '<C-Down>', ':resize -2<CR>', desc = 'resize down' },
    { '<C-Left>', ':vertical resize -2<CR>', desc = 'resize left' },
    { '<C-Right>', ':vertical resize +2<CR>', desc = 'resize right' },

    { '<leader>s', '<cmd>update<cr>', desc = 'save file' },
    { 'g<Tab>', '<cmd>exe "tabn ".g:lasttab<cr>', desc = 'Switch to previous tab' },
    { '<F6>', function() vim.opt.spell = not vim.o.spell end, desc = 'toggle vim spell' },
    { '<Esc>', ':nohlsearch<CR>', desc = 'Stop highlight search' },
    { '<BS>', ':%s/\\s\\+$//<CR>:w<CR>', desc = 'Remove trailing whitespaces' },

    -- visual mode
    { '<', '<gv', desc = 'stay in indent mode to left', mode = 'v' },
    { '>', '>gv', desc = 'stay in indent mode to right', mode = 'v' },
    { 'J', ":m '>+1<CR>gv=gv", desc = 'move text down and indent', mode = 'v' },
    { 'K', ":m '<-2<CR>gv=gv", desc = 'move up text and indent', mode = 'v' },
    { '<C-s>', ':sort i<CR>', desc = 'Sort visual lines', mode = 'v' },

    -- clipboard, shared between normal and visual
    { '<leader>y', '"+y', desc = 'copy to clipboard', mode = { 'n', 'v' } },
    { '<leader>p', '"+p', desc = 'paste from clipboard', mode = { 'n', 'v' } },

    -- native snippet navigation, replaces the LuaSnip jump maps
    { '<C-l>', function() vim.snippet.jump(1) end, desc = 'jump forward in snippet', mode = { 'i', 's' } },
    { '<C-h>', function() vim.snippet.jump(-1) end, desc = 'jump backward in snippet', mode = { 'i', 's' } },
  },
})
