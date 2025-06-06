return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls"},
        automatic_installation = true,
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      vim.lsp.config('ts_ls', {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
              languages = {"javascript", "typescript", "vue"},
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      })

    end
  },

}
