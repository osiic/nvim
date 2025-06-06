-- lua/core/lsp.lua
local M = {}

function M.setup()
	-- Keymaps with better organization and consistency
	local lsp_keymaps = {
		-- Navigation
		{ "n", "gd", vim.lsp.buf.definition, "Goto Definition" },
		{ "n", "gr", require("telescope.builtin").lsp_references, "Goto References" },
		{ "n", "gI", vim.lsp.buf.implementation, "Goto Implementation" },
		{ "n", "gy", vim.lsp.buf.type_definition, "Goto Type Definition" },

		-- Documentation
		{ "n", "K", vim.lsp.buf.hover, "Hover Documentation" },
		{ "n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help" },

		-- Code Actions
		{ "n", "<leader>ca", vim.lsp.buf.code_action, "Code Action" },
		{ "n", "<leader>cr", vim.lsp.buf.rename, "Rename Symbol" },
		{ "n", "<leader>cf", vim.lsp.buf.format, "Format Document" },

		-- Diagnostics
		{ "n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic" },
		{ "n", "]d", vim.diagnostic.goto_next, "Next Diagnostic" },
		{
			"n",
			"<C-w>d",
			function()
				vim.diagnostic.open_float({
					border = "rounded",
					focusable = false,
					scope = "cursor",
				})
			end,
			"Show diagnostics",
		},
	}

	for _, map in ipairs(lsp_keymaps) do
		vim.keymap.set(map[1], map[2], map[3], { desc = map[4] })
	end

	-- Enhanced UI Configuration
	local signs = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	}

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	vim.diagnostic.config({
		virtual_text = {
			prefix = "●",
			spacing = 4,
		},
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = function(diagnostic)
				return string.format("(%s) ", diagnostic.source or "unknown")
			end,
		},
	})
end

return M
