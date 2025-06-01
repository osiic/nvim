return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        local buf_map = function(mode, lhs, rhs)
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
        end

        buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
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
