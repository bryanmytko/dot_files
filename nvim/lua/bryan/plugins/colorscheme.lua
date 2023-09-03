return {
  {
    "KabbAmine/yowish.vim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme yowish]])
    end,
  },
}
