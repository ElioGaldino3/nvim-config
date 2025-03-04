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

-- Use a protected call so we don't error out on first use
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
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim", }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim",  }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs",  }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim",  })
	use({ "JoosepAlviste/nvim-ts-context-commentstring",  })
	use({ "kyazdani42/nvim-web-devicons",  })
	use({ "kyazdani42/nvim-tree.lua",  })
	use({ "akinsho/bufferline.nvim",  })
	use({ "moll/vim-bbye",  })
	use({ "nvim-lualine/lualine.nvim",  })
	use({ "lewis6991/impatient.nvim",  })
	use({ "goolord/alpha-nvim",  })
	use("folke/which-key.nvim")

	-- Colorschemes
    use("Shatur/neovim-ayu")
    use('navarasu/onedark.nvim')
    use({ 'xiyaowong/nvim-transparent', })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp",  }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer",  }) -- buffer completions
	use({ "hrsh7th/cmp-path",  }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip",  }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp",  })
	use({ "hrsh7th/cmp-nvim-lua",  })

	-- snippets
	use({ "L3MON4D3/LuaSnip",  }) --snippet engine

	-- LSP
	use({ "neovim/nvim-lspconfig",  }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer",  }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim",  }) -- for formatters and linters

	-- Telescope
	use({ "nvim-telescope/telescope.nvim",  })

	-- Treesitter
	use({"nvim-treesitter/nvim-treesitter",})
    use("p00f/nvim-ts-rainbow")
    use({'nvim-treesitter/playground'})

	-- Git
	use({ "lewis6991/gitsigns.nvim", })

	--Debugging
    use({ "mfussenegger/nvim-dap",})
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- Navigation
    use({ 'phaazon/hop.nvim', })
  
    use({ 'terrortylor/nvim-comment' })

    use({ '/mnt/BackupSSD/Projetos/Estudos/Neovim/fluter-lua.nvim'})
  
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)


