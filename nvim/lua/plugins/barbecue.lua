local opts = {
    theme = "catppuccin-mocha",
    dim_dirname = true, -- directory name is dimmed by default
    bold_basename = true,
    dim_context = false,
    alt_background = false,
}

return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    opts = opts,
    version = "*",
    event = "BufReadPre",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
}
