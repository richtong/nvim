-- Based on plugins from https://www.lazyvim.org lunarvim.org
-- Uses Lazyvim for configuration
-- https://github.com/LazyVim/starter/blob/main/lua/plugins/example.lua
--
-- base components for LSP, DAP, completions and linters
return {
  {
	  "LazyVim/LazyVim",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-lualine/lualine.nvim",
  },
  {
	  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	  "neovim/nvim-lspconfig",
	  "mfussenegger/nvim-dap",

  },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
	    ensure_installed = {
		    "bash",
		    "html",
		    "javascript",
		    "json",
		    "lua",
		    "markdown",
		    "markdown_inline",
		    "python",
		    "query",
		    "regex",
		    "tsx",
		    "typescript",
		    "vim",
		    "yaml",
	},
    },
  },
  {
	  "williamboman/mason.nvim",
	  opts= {
		  ensure_installed = {
		  	"stylua",
			"shellcheck",
			"shfmt",
			"ruff",
		  },

	  },
  },
  {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function() 
		require("codeium").setup({
		})
	end
   },
}
