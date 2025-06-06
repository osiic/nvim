local M = {}

function M.setup()
  -- Keymaps
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
  vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Goto References" })
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

  -- UI
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    virtual_text = true,
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
      prefix = "",
    },
  })
end

return M
