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
}
