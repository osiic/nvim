return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.stylua,
				require("none-ls.diagnostics.eslint"),
				require("none-ls.code_actions.eslint"),
			},
			vim.keymap.set("n", "<leader>s", vim.lsp.buf.format, {}),
		})
	end,
}
