----- Bootstrap `packer` -----------------------------------------------------------------------------------------------
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end
------------------------------------------------------------------------------------------------------------------------

----- Install/load plugins ---------------------------------------------------------------------------------------------
require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Plugins ---------------------------------------------------------------------------------------------------------
    use 'preservim/tagbar'
    use 'lervag/vimtex'
    use 'nvim-lua/plenary.nvim'
    use 'scrooloose/nerdcommenter'
    use 'kyazdani42/nvim-web-devicons'
    use 'goolord/alpha-nvim'
    -- use 'puremourning/vimspector'
    use 'akinsho/toggleterm.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'windwp/nvim-autopairs'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true -- optional, for file icons
        },
        tag = 'nightly'
    }
    use 'moll/vim-bbye'
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    use 'kdheepak/tabline.nvim'
    use { 'folke/which-key.nvim', config = function() require('which-key').setup() end }
    use { 'ray-x/lsp_signature.nvim' }
    use { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' }

    -- cmp plugins
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use 'hrsh7th/cmp-nvim-lsp'
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        }
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Telescope -------------------------------------------------------------------------------------------------------
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { 'nvim-lua/plenary.nvim' },
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        requires = { 'nvim-telescope/telescope.nvim' },
        run = 'make'
    }
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    --------------------------------------------------------------------------------------------------------------------

    -- Debug Adapter Protocol ------------------------------------------------------------------------------------------
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'ldelossa/nvim-dap-projects'
    --------------------------------------------------------------------------------------------------------------------

    -- LanguageServerProtocol (LSP) plugins ----------------------------------------------------------------------------
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'jay-babu/mason-nvim-dap.nvim'
    use 'neovim/nvim-lspconfig'
    --------------------------------------------------------------------------------------------------------------------

    -- colorschemes ----------------------------------------------------------------------------------------------------
    use 'morhetz/gruvbox'
    use 'sainnhe/everforest'
    use {'catppuccin/nvim', as = 'catppuccin' }
    --------------------------------------------------------------------------------------------------------------------

    -- Automatically set up your configuration after cloning packer.nvim.  Put this at the end after all plugins.
    if packer_bootstrap then
        require('packer').sync()
    end
end)
------------------------------------------------------------------------------------------------------------------------

----- Configure Plugins ------------------------------------------------------------------------------------------------


require('plugins.configs.alpha')
require('plugins.configs.blankline')
require('plugins.configs.colorscheme')
require('plugins.configs.dap')
require('plugins.configs.gitsigns')
require('plugins.configs.mason')
require('plugins.configs.lspconfig')
require('plugins.configs.lsp_signature')
require('plugins.configs.lualine')
require('plugins.configs.nerdcommenter')
require('plugins.configs.nvim-autopairs')
require('plugins.configs.nvim-cmp')
require('plugins.configs.nvim-tree')
require('plugins.configs.nvim-treesitter')
require('plugins.configs.tabline')
require('plugins.configs.telescope')
require('plugins.configs.toggleterm')
-- require('plugins.configs.vimspector')
require('plugins.configs.vimtex')

