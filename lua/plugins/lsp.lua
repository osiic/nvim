return {
	-- Mason (Package Manager untuk LSP, DAP, Linter, Formatter)
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	-- Mason LSP Config
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls", -- JavaScript/TypeScript
					"html", -- HTML
					"cssls", -- CSS
					"tailwindcss", -- Tailwind
					"intelephense", -- PHP/Laravel
					"emmet_ls", -- Emmet
					"lua_ls", -- Lua
					-- Uncomment jika butuh:
					-- "jdtls",     -- Java
					-- "pyright",   -- Python
				},
				automatic_installation = true,
			})
		end,
	},

	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip", -- kalau kamu pakai snippet
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Setup untuk masing-masing LSP
			for _, server in ipairs({
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"intelephense",
				"emmet_ls",
				"lua_ls",
			}) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end

			-- Khusus Lua
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})
		end,
	},
}
