-- This file can be loaded by calling `lua require('plugins')` from your `init.vim`

-- Only needed if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'craftzdog/solarized-osaka.nvim'
  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'
  use 'lewis6991/gitsigns.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'tanvirtin/monokai.nvim'
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('theprimeagen/harpoon')
  use ('tpope/vim-fugitive')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},  -- Required
      {'williamboman/mason.nvim', -- Required to manage LSP servers
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional for integrating mason with lspconfig

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required for snippets
    }
  }

  -- Configuration for nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- Optional for icons
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }

  -- Other plugins
  use ('ThePrimeagen/vim-be-good') -- Game for learning nvim
  use ('kevinhwang91/nvim-hlslens')
  use ('jose-elias-alvarez/null-ls.nvim')
  use ('MunifTanjim/prettier.nvim') -- Prettier / Formatter
  use ('terrortylor/nvim-comment') -- Easy commenting of code
  use ('feline-nvim/feline.nvim') -- Status bar
  use {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup({
        -- configuration here if necessary
      })

      vim.cmd('colorscheme github_dark')
    end
  }
end)
