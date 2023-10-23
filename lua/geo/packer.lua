-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- File tree
  use 'nvim-tree/nvim-tree.lua'
  -- File tree icons 
  use 'nvim-tree/nvim-web-devicons'
  -- Github-copilot
  use 'github/copilot.vim'
  use 'lewis6991/gitsigns.nvim'
  -- Status line
  use  {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  --Theme 
  --use({
  --    'folke/tokyonight.nvim',
  --    as = 'tokyonight',
  --    config = function()
  --         vim.cmd('colorscheme tokyonight')
  --    end
  --})

 use({
     'marko-cerovac/material.nvim',
     as = 'material',
     config = function()
          vim.cmd('colorscheme material')
     end
 })

--

--  use "rebelot/kanagawa.nvim"

    -- Integrated terminal
  -- <leader>; to toggle
  use 's1n7ax/nvim-terminal'

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  -- LSP setup 
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
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
		  {'rafamadriz/friendly-snippets'},	  }
  }
end)
