return require("lazy").setup({
  spec = {
    -- Import all plugin specs from the plugins directory
    { import = "plugins" },
  },
  defaults = {
    lazy = true, -- Load plugins lazily
  },
  install = {
    colorscheme = { "habamax" }, -- Default colorscheme to use during installation
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- Reset the package path to improve startup time
    rtp = {
      reset = true,        -- Reset the runtime path to improve startup time
      disabled_plugins = { -- Disable some vim plugins for improved startup time
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
