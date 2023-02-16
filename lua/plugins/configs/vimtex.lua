vim.g.tex_flavor = 'latex'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_zathura_options = '-x "nvr --servername ' .. vim.api.nvim_get_vvar('servername') .. ' --remote-silent %{input} -c %{line}"'
