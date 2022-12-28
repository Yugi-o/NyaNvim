local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	git = {
		clone_timeout = 300, -- Timeout, in seconds, for git clones
	},
})

return packer.startup(function(use)
	-- My plugins here
	use({
		"wbthomason/packer.nvim",
	})
	use({
		"nvim-lua/plenary.nvim",
	})
	use({
		"lewis6991/impatient.nvim",
	})
	use({
		"kyazdani42/nvim-web-devicons",
	})
	use({
		"MunifTanjim/nui.nvim",
	})
	use({
		"Darazaki/indent-o-matic",
		config = function()
			require("configs.indent-o-matic")
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		event = "UIEnter",
		config = function()
			require("configs.bufferline")
		end,
	})
	use({
		"famiu/bufdelete.nvim",
	})
	use({ --*
		"nvim-lualine/lualine.nvim",
		config = function()
			require("configs.lualine")
		end,
	})
	use({
		"goolord/alpha-nvim",
		config = function()
			require("configs.alpha")
		end,
	})
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("configs.notify")
		end,
	})
	use({
		"marko-cerovac/material.nvim",
		config = function()
			require("configs.colorscheme")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
	})
	use({
		"p00f/nvim-ts-rainbow",
	})
	use({
		"windwp/nvim-ts-autotag",
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
	})
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("configs.telescope")
		end,
	})
	use({
		"Shatur/neovim-session-manager",
		config = function()
			require("configs.session-manager")
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("configs.cmp")
		end,
	})
	use({
		"hrsh7th/cmp-buffer",
	})
	use({
		"hrsh7th/cmp-path",
	})
	use({
		"hrsh7th/cmp-nvim-lsp",
	})
	use({
		"hrsh7th/cmp-nvim-lua",
	})
	use({
		"saadparwaiz1/cmp_luasnip",
	})
	use({
		"L3MON4D3/LuaSnip",
	})
	use({
		"rafamadriz/friendly-snippets",
	})
	use({
		"onsails/lspkind.nvim",
	})
	use({
		"neovim/nvim-lspconfig",
	})
	use({
		"williamboman/mason-lspconfig.nvim",
	})
	use({
		"williamboman/mason.nvim",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
	})
	use({
		"jay-babu/mason-null-ls.nvim",
	})
	use({
		"j-hui/fidget.nvim",
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("configs.whichkey")
		end,
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		config = function()
			require("configs.neotree")
		end,
	})
	use({
		"s1n7ax/nvim-window-picker",
		tag = "v1.*",
		config = function()
			require("configs.windowpicker")
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("configs.colorizer")
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("configs.comment")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("configs.indentline")
		end,
	})
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("configs.toggleterm")
		end,
	})
	use({
		"phaazon/hop.nvim",
		config = function()
			require("configs.hop")
		end,
	})
	use({
		"utilyre/barbecue.nvim",
		config = function()
			require("configs.barbecue")
		end,
	})
	use({
		"smiteshp/nvim-navic",
	})
	use({
		"andweeb/presence.nvim",
	})
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("configs.dressing")
		end,
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
