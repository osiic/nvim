-- LSP
-- Mason = tempat dowload package nya
-- Moson LSP Config = auto dowload pakage nya
-- Nvim LSP Config = ngatur pakage nya
-- "jay-babu/mason-null-ls.nvim",
return {
  {
    "jay-babu/mason-null-ls.nvim",
    lazy = true,
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "tailwindcss", "eslint" },
        automatic_installation = true,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          'prettierd',
        },
        auto_update = false,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.eslint.setup({})
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- Keymap
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
