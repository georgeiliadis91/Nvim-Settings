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
  use 'lewis6991/gitsigns.nvim'
  -- Status line
  --
  use  {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Tabs
  -- use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  -- use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'

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
	'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  --Theme 
  use({
      'loctvl842/monokai-pro.nvim',
      as = 'monokai-pro',
      config = function()
          vim.cmd('colorscheme monokai-pro')
      end
  })

--use {
--    'uloco/bluloco.nvim',
--    requires = { 'rktjmp/lush.nvim' },
--        as = 'bluloco',
--        config = function()
--         vim.cmd('colorscheme bluloco')
--        end
--
--}
--  use "rebelot/kanagawa.nvim"

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('brenoprata10/nvim-highlight-colors')
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
