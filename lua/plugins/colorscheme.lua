local transparent_opts = {
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
}

return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = transparent_opts,
  },

  {
    "oskarnurm/koda.nvim",
    lazy = true,
    opts = transparent_opts,
  },

  {
    "vague-theme/vague.nvim",
    lazy = true,
    opts = transparent_opts,
  },

  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
  },

  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    opts = transparent_opts,
  },
}
