local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

----- Global mappings --------------------------------------------------------------------------------------------------

--Remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', 'q', '<C-w>c', opts)

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Move text up and down
vim.keymap.set('x', 'J', ':move \'>+1<CR>gv-gv', opts)
vim.keymap.set('x', 'K', ':move \'<-2<CR>gv-gv', opts)

-- Better terminal navigation
vim.keymap.set('t', '<esc>', '<C-\\><C-n>', term_opts)
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)
vim.keymap.set('t', '<C-q>', '<C-\\><C-N><C-w>c', term_opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', opts)

vim.keymap.set('n', '<F6>', function() vim.opt.spell = not vim.o.spell end, opts)

-- Stop highlight search with <Esc> in normal mode
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', opts)

-- Sort visual lines
vim.keymap.set('v', '<C-s>', ':sort i<CR>', term_opts)

-- Delete trailing whitespaces
vim.keymap.set('n', '<BS>', ':%s/\\s\\+$//<CR>:w<CR>', opts)

------------------------------------------------------------------------------------------------------------------------

----- Plugin mappings --------------------------------------------------------------------------------------------------

local wk = require('which-key')

wk.register({
    s = { '<cmd>update<cr>', 'save file' }
}, { prefix = '<leader>' })

vim.keymap.set('n', '<C-c>', ":call nerdcommenter#Comment('n', 'toggle')<CR>", opts)
vim.keymap.set('v', '<C-c>', ":call nerdcommenter#Comment('x', 'toggle')<CR>", opts)

 vim.keymap.set('n', '<F2>', ':TagbarToggle<CR>', opts)
 vim.keymap.set('n', '<F3>', ':NvimTreeToggle<CR>', opts)


 wk.register({
     name = 'Telescope',
     f = { function() require('telescope.builtin').find_files() end, 'Find file' },
     ['/'] = { function() require('telescope.builtin').live_grep() end, 'grep in directory' },
     s = { function() require('telescope.builtin').current_buffer_fuzzy_find() end, 'seach in buffer' },
     b = { function() require('telescope').extensions.file_browser.file_browser() end, 'File browser' },
     g = {
         f = { function() require('telescope.builtin').git_files() end, 'Find file tracked in Git' },
         b = { function() require('telescope.builtin').git_branches() end, 'Find Git branch' },
         c = { function() require('telescope.builtin').git_commits() end, 'Find Git commit' },
         h = { function() require('telescope.builtin').git_bcommits() end, 'Find buffer\'s Git commit (history)' },
     },
 }, { prefix = 'f' })

 wk.register({
     name = 'bbye',
     ['d'] = { '<cmd>Bdelete<cr>', 'Delete current buffer' },
 }, { prefix = '<Leader>b' })

 vim.keymap.set('', 's', '<Nop>', opts)
 wk.register({
     name = 'Split',
     g = { '<cmd>vsplit<cr>', 'Vertical split' },
     v = { '<cmd>split<cr>', 'Horizontal split' },
 }, { prefix = 's' })

 wk.register({
    name = 'Debug',
    b = { function() require('dap').toggle_breakpoint() end, 'Make a breakpoint' },
    B = { function() require('dap').toggle_breakpoint(vim.fn.input('Condition: ')) end, 'Conditional breakpoint' },
    e = { function() require('dap').clear_breakpoints() end, 'Clear all breakpoints' },
    o = { function() require('dap').step_over() end, 'Step over' },
    i = { function() require('dap').step_into() end, 'Step into' },
    x = { function() require('dap').run_to_cursor() end, 'Run to cursor' },
    c = { function() require('dap').continue() end, 'Launch or continue' },
    k = { function() require('dap').terminate() end, 'Terminate' },
    r = { function() require('dap').restart() end, 'Restart' },
    w = {
        name = 'watches',
        a = { function() require('dapui').elements.watches.add(vim.fn.input('Expression: ')) end, 'Add watch' },
        r = { function() require('dapui').elements.watches.remove(vim.fn.input('Index: ')) end, 'Remove watch' },
    }
 }, { prefix = '<leader>d' })

 wk.register({
     t = { '<cmd>ToggleTerm<cr>', 'Show terminal' },
 }, {prefix = '<leader>'})

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

------------------------------------------------------------------------------------------------------------------------

