-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Bootstrap Packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

 use("folke/tokyonight.nvim")
 
  -- Rose Pine theme
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require("rose-pine").setup({
        variant = "auto", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        
        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },
        
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
    end
  })
  -- nvim-java and its dependencies
  use 'nvim-java/nvim-java'
  use 'nvim-java/lua-async-await'
  use 'nvim-java/nvim-java-core'
  use 'nvim-java/nvim-java-test'
  use 'nvim-java/nvim-java-dap'
  
  -- Additional dependencies
  use 'MunifTanjim/nui.nvim'
  use 'mfussenegger/nvim-dap'

  -- Mason needs to be loaded before mason-lspconfig
  use('williamboman/mason.nvim')


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
  
  -- Notification plugin
  use({
    'rcarriga/nvim-notify',
    config = function()
      require("notify").setup({
        stages = "fade_in_slide_out",
        render = "compact",
        timeout = 3000,
        background_colour = "Normal",
        minimum_width = 50,
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
      })
      vim.notify = require("notify")
    end
  })
  
  -- Image viewing in Neovim
  use({
    'edluffy/hologram.nvim',
    config = function()
      require('hologram').setup({
        auto_display = true -- automatically display images
      })
    end
  })
  
  -- Seamless navigation between tmux panes and vim splits
  use('christoomey/vim-tmux-navigator')


  use({"nvim-treesitter/nvim-treesitter", run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
  end})
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
  'startup-nvim/startup.nvim',
  requires = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'}
}
use('neovim/nvim-lspconfig')
use('nvimtools/none-ls.nvim') -- Updated fork of null-ls
use('MunifTanjim/prettier.nvim')
use('jay-babu/mason-null-ls.nvim')
use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Using version 2
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
})
use "rafamadriz/friendly-snippets"

  -- Claude Code integration
  use 'greggh/claude-code.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)

