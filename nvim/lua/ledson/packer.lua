vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- colorscheme rosepine
    use({
        'rose-pine/neovim',
        as = 'rose-pine'
    })
    -- colorscheme
    use {'rebelot/kanagawa.nvim'}
    -- colorscheme solarized-osaka
    use{'craftzdog/solarized-osaka.nvim'}
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use('sbdchd/neoformat')
    use('lukas-reineke/indent-blankline.nvim')
    -- file manager
    use('ms-jpq/chadtree')
    -- emmet
    use('mattn/emmet-vim')
    -- autoclose tags
    use('windwp/nvim-ts-autotag')
    -- autopairs
    use{
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    }
    -- discord reach presence
    use{
        'andweeb/presence.nvim',
    }
    -- Bufferline.
    use{
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    -- lualine.
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- colorscheme 
    use {'vague2k/vague.nvim'}
    -- managing closing buffers. 
    use {'ojroques/nvim-bufdel'}
    -- installing zen mode.
    use {'folke/zen-mode.nvim'}
    -- installing rust.
    use {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
    }
    use "EdenEast/nightfox.nvim"
end)
