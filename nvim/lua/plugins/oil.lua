local opts = {
    view_options = {
        show_hidden = true,
    },
}

return {
    "stevearc/oil.nvim",
    opts = opts,
    cmd = "Oil",
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
