local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--require("lazy").setup(plugins, opts)

require("lazy").setup({
	'NTBBloodbath/doom-one.nvim',
	"mhartington/oceanic-next",
	"morhetz/gruvbox",
	"zootedb0t/citruszest.nvim",
	"Mofiqul/dracula.nvim",
	"shaunsingh/moonlight.nvim",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		'nvim-telescope/telescope.nvim', 
		dependencies = {'nvim-lua/plenary.nvim'}
	},
	"stevearc/oil.nvim",

	-- cmp
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',

	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',

	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',

	-- Mason
	"williamboman/mason.nvim",

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons"},
	},

	"nvim-treesitter/nvim-treesitter",

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
						},
					},
				},
			},
		}
	end,
},

})

-- Oil
require("oil").setup()
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
