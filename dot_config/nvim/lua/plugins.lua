return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {"kyazdani42/nvim-web-devicons"}}
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
}
end)
