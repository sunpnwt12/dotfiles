local opts = {
    indent = {
        char = "│",
        highlight = "IndentBlanklineChar",
    },
    scope = {
        enabled = false,
        show_start = false,
        show_end = false,
        highlight = "IndentBlanklineContextChar",
    },
}
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = opts,
    event = { "BufReadPost", "BufNewFile" },
}
