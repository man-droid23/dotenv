return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- load during startup
    priority = 1000, -- load this before all other plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
}
