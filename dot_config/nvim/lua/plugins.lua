return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.treesitter")
		end,
		run = ":TSUpdate",
		-- branch = "0.5-compat",
	})
  use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("kyazdani42/nvim-web-devicons")
	-- use { 'ibhagwan/fzf-lua', requires = { 'vijaymarupudi/nvim-fzf' } }
	use("itchyny/vim-cursorword")
	use("lewis6991/gitsigns.nvim")
	use("romgrk/barbar.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/tokyonight.nvim")
	use("neovim/nvim-lspconfig")
	use("kabouzeid/nvim-lspinstall")
	use({ "ms-jpq/coq_nvim", branch = "coq" })
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	use("ray-x/lsp_signature.nvim")
	use("sbdchd/neoformat")
	use("tpope/vim-commentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("tommcdo/vim-lion")
	use("nacro90/numb.nvim")
	use("p00f/nvim-ts-rainbow")
	use({ "glepnir/galaxyline.nvim", config = "require('config.galaxyline').post()" })
	use("norcalli/nvim-colorizer.lua")
	use("nvim-telescope/telescope.nvim")
	use("AndrewRadev/sideways.vim")
	use("AndrewRadev/splitjoin.vim")
	use("matze/vim-move")
	use("bkad/CamelCaseMotion")
	use("tpope/vim-abolish")
	use("tpope/vim-surround")
	use("terryma/vim-expand-region")
	use("inside/vim-search-pulse")
end)
