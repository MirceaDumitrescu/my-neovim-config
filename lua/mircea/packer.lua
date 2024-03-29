-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

 use("folke/tokyonight.nvim")
  -- nvim-java and its dependencies
  use 'nvim-java/nvim-java'
  use 'nvim-java/lua-async-await'
  use 'nvim-java/nvim-java-core'
  use 'nvim-java/nvim-java-test'
  use 'nvim-java/nvim-java-dap'
  
  -- Additional dependencies
  use 'MunifTanjim/nui.nvim'
  use 'mfussenegger/nvim-dap'

  -- Mason with specific configuration
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup {
        registries = {
          ['github:nvim-java'] = 'github:nvim-java/mason-registry',
          ['github:mason-org'] = 'github:mason-org/mason-registry',
        }
      }
    end
  }


  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
          }
      end
  })

  use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
          require("todo-comments").setup {}
      end
  })

  use('nvim-tree/nvim-web-devicons')


  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
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

  use("github/copilot.vim")
  use('kdheepak/lazygit.nvim')
  use('prettier/vim-prettier')
  use {
      's1n7ax/nvim-terminal',
      config = function()
          vim.o.hidden = true
          require('nvim-terminal').setup()
      end,
  }
  use("tpope/vim-commentary") -- Commenting
  use('brenoprata10/nvim-highlight-colors') -- Highlight colors
  use('voldikss/vim-floaterm')
  use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}
use "sindrets/diffview.nvim"
use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
use 'romgrk/barbar.nvim'
use 'ray-x/web-tools.nvim'
use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
use { 'm-demare/hlargs.nvim' }
use {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}
use('neovim/nvim-lspconfig')
use('jose-elias-alvarez/null-ls.nvim')
use('MunifTanjim/prettier.nvim')
use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
})
use "rafamadriz/friendly-snippets"
end)

