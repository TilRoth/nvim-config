return {
    { 'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim', 'folke/which-key.nvim' },
        config = function()
            require('telescope').setup {
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "-L",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                    },
                    prompt_prefix = "   ",
                    selection_caret = "  ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.45,
                            results_width = 0.8,
                        },
                            vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },
                    file_sorter = require("telescope.sorters").get_fuzzy_file,
                    file_ignore_patterns = { "node_modules" },
                    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                    path_display = { "truncate" },
                    winblend = 0,
                    border = {},
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                    -- Developer configurations: Not meant for general override
                    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                    mappings = {
                      n = { ["q"] = require("telescope.actions").close },
                    },
                },
            }

            local wk = require('which-key')
            wk.register({
                name = 'Telescope',
                f = { function() require('telescope.builtin').find_files() end, 'Find file' },
                ['/'] = { function() require('telescope.builtin').live_grep() end, 'grep in directory' },
                b = { function() require('telescope.builtin').current_buffer_fuzzy_find() end, 'fuzzy find in buffer' },
                s = { function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end, 'Find symbols' },
                d = { function() require('telescope.builtin').diagnostics{ severity_limit = vim.diagnostic.severity.WARN } end, 'Search diagnostics' },
                g = {
                    f = { function() require('telescope.builtin').git_files() end, 'Find file tracked in Git' },
                    b = { function() require('telescope.builtin').git_branches() end, 'Find Git branch' },
                    c = { function() require('telescope.builtin').git_commits() end, 'Find Git commit' },
                    h = { function() require('telescope.builtin').git_bcommits() end, 'Find buffer\'s Git commit (history)' },
                 },
            }, { prefix = 'f' })
        end
    },
    { 'nvim-telescope/telescope-fzf-native.nvim',
        dependencies = 'nvim-telescope/telescope.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        config = function()
            local telescope = require('telescope')
            telescope.setup {
                extensions = {
                    ['fzf'] = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = 'smart_case',        -- or "ignore_case" or "respect_case"
                    },
                }
            }
            telescope.load_extension('fzf')
        end
    },
    { 'nvim-telescope/telescope-ui-select.nvim',
        dependencies = 'nvim-telescope/telescope.nvim',
        config = function()
            local telescope = require('telescope')
            telescope.setup {
                extensions = {
                    ['ui-select'] = { require('telescope.themes').get_dropdown { } },
                }
            }
            telescope.load_extension('ui-select')
        end
    },
    { 'debugloop/telescope-undo.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'folke/which-key.nvim' },
        config = function()
            local telescope = require('telescope')
            telescope.load_extension('undo')

            local wk = require('which-key')
            wk.register({
                 u = { function() require('telescope').extensions.undo.undo() end, 'Undo history' },
            }, { prefix = 'f' })
        end
    },
}
