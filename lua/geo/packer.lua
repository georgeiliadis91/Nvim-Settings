-- This file can be loaded by calling `lua require('plugins')` from your init.vimpacker

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- File tree icons 
  use 'nvim-tree/nvim-web-devicons'

  -- Github-copilot
  use 'github/copilot.vim'
  --
  -- Status line
  --
  use  {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Tabs plugin These optional plugins should be loaded directly because of a bug in Packer lazy loading
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'


  -- Tabs
  -- use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons

  -- File tree
  use 'nvim-tree/nvim-tree.lua'

  -- Markers
    --mx              Set mark x
    --m,              Set the next available alphabetical (lowercase) mark
    --m;              Toggle the next available mark at the current line
    --dmx             Delete mark x
    --dm-             Delete all marks on the current line
    --dm<space>       Delete all marks in the current buffer
    --m]              Move to next mark
    --m[              Move to previous mark
    --m:              Preview mark. This will prompt you for a specific mark to
    --                preview; press <cr> to preview the next mark.
    --                
    --m[0-9]          Add a bookmark from bookmark group[0-9].
    --dm[0-9]         Delete all bookmarks from bookmark group[0-9].
    --m}              Move to the next bookmark having the same type as the bookmark under
    --                the cursor. Works across buffers.
    --m{              Move to the previous bookmark having the same type as the bookmark under
    --                the cursor. Works across buffers.
    --dm=             Delete the bookmark under the cursor.
  use 'chentoast/marks.nvim'

  use {
	  "nvim-telescope/telescope.nvim", tag = "0.1.3",
	  -- or                            , branch = "0.1.x",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }

  --Theme 
  --
--  use "olimorris/onedarkpro.nvim"
  -- NOTE: colorbuddy must stay on v1.0.0. On `main` its `colorscheme()` no
  -- longer requires the theme module, which silently breaks cobalt2.
  use {
    'lalitmee/cobalt2.nvim',
    requires = { 'tjdevries/colorbuddy.nvim', tag = 'v1.0.0' }
  }

  use({"nvim-treesitter/nvim-treesitter", tag = "v0.10.0", lazy = false, build = ":TSUpdate" })
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('brenoprata10/nvim-highlight-colors')
  -- LSP setup
  --
  -- lsp-zero has been removed: its v2.x branch is unmaintained and drives the
  -- deprecated `require('lspconfig')` framework, which nvim-lspconfig will
  -- delete in v3.0.0. Servers are configured natively via `vim.lsp.config`
  -- in after/plugin/lsp.lua instead.
  use {'neovim/nvim-lspconfig'}
  use {'mason-org/mason.nvim'}
  use {'mason-org/mason-lspconfig.nvim'}

  -- Autocompletion
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'saadparwaiz1/cmp_luasnip'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-nvim-lua'}

  -- Snippets
  use {'L3MON4D3/LuaSnip'}
  use {'rafamadriz/friendly-snippets'}
end)

