return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			local on_attach = function(client, bufnr)
				local buf_map = function(mode, lhs, rhs, opts)
					opts = opts or { noremap = true, silent = true }
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				-- Mappings
				buf_map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
				buf_map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
				buf_map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
				buf_map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
				buf_map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
				buf_map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
				buf_map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
				buf_map("n", "gf", function()
					vim.lsp.buf.format({ async = true })
				end, { desc = "Format buffer" })
				buf_map("n", "ge", vim.diagnostic.open_float, { desc = "Show diagnostics" })
				buf_map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
				buf_map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			end

			lspconfig.ts_ls.setup({
				on_attach = on_attach,
				filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
				cmd = { "typescript-language-server", "--stdio" },
			})

			lspconfig.eslint.setup({
				on_attach = on_attach,
			})

			lspconfig.tailwindcss.setup({
				on_attach = on_attach,
			})

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
}
