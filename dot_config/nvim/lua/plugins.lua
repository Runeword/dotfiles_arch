return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use {"kyazdani42/nvim-web-devicons"}
  use { 'camspiers/snap'}
  use {"romgrk/barbar.nvim"}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end

  }
  use {"neovim/nvim-lspconfig"}
  use {"kabouzeid/nvim-lspinstall"}
  use {"glepnir/lspsaga.nvim"}
  use {"hrsh7th/nvim-compe"}
  use 'folke/tokyonight.nvim'
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require'my_statusline' end
  }
end)
