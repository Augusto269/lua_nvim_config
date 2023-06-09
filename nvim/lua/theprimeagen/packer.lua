-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'tanvirtin/monokai.nvim'
  use ('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
  use ('theprimeagen/harpoon')
  use ('tpope/vim-fugitive')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	  {'L3MON4D3/LuaSnip'},     -- Required
  }
}
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
  config = function()
    require("nvim-tree").setup {}
  end
}
    use ('ThePrimeagen/vim-be-good') -- game for learing nvim
    use ('kevinhwang91/nvim-hlslens')
    use ('jose-elias-alvarez/null-ls.nvim')
    use ('MunifTanjim/prettier.nvim') -- prettier / formmater
    use ('terrortylor/nvim-comment') -- comment code easy
    use ('feline-nvim/feline.nvim') -- status bar
end)
