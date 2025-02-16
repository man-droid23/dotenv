return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",  -- Lua
          "pyright",
          "gopls",
          "rust_analyzer",
        },
        automatic_installation = true,
      })

      -- LSP configurations
      local lspconfig = require("lspconfig")

      -- Configure lua_ls for neovim
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- Configure other language servers
      lspconfig.pyright.setup({})     -- Python
      lspconfig.gopls.setup({})       -- Go
      lspconfig.rust_analyzer.setup({}) -- Rust
    end,
  },
}
