-- This file can be loaded by calling `lua require('plugins')` from your `init.vim`

-- Only needed if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'
  use 'lewis6991/gitsigns.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

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
  -- Elixir cfgs
  use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" }})

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
   use "lukas-reineke/indent-blankline.nvim"
 use {
  'filipdutescu/renamer.nvim',
  branch = 'master',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {
  "andrewferrier/debugprint.nvim",
  config = function()
    require("debugprint").setup()
  end
}
  use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}
-- nvim copilot:
use {
  'CopilotC-Nvim/CopilotChat.nvim',
  requires = {
    { 'github/copilot.vim' }, -- o 'zbirenbaum/copilot.lua'
    { 'nvim-lua/plenary.nvim' },
  },
  run = 'make tiktoken', -- Solo en macOS o Linux
  config = function()
    require('CopilotChat').setup {
      -- Opciones de configuración
    }
  end,
}
-- auto sesion
use {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    }
  end
}
-- theme instalation
use {
  "catppuccin/nvim",
  as = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Opciones: latte, frappe, macchiato, mocha
      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
        cmp = true,
        gitsigns = true,
        telescope = true,
        nvimtree = true,
        indent_blankline = { enabled = true },
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
-- git url
 use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
}

-- intro change
use {
    'goolord/alpha-nvim',
    requires = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
}
end)
