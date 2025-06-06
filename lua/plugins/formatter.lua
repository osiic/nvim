return {
	-- Formatter (Prettier, StyLua, dkk)
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					php = { "php-cs-fixer" },
					lua = { "stylua" },
					-- python = { "black" },
					-- java = { "google-java-format" }
				},
				format_on_save = {
					timeout_ms = 1500,
					lsp_fallback = true,
				},
			})
		end,
	},

	-- Mason Formatter (Untuk install formatter)
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier", -- JS/TS Formatter
					"stylua", -- Lua Formatter
					"php-cs-fixer", -- PHP Formatter
					-- "black",       -- Python Formatter
					-- "google-java-format" -- Java Formatter
				},
			})
		end,
	},
}
