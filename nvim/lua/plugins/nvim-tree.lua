local opts = {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    git = {
        enable = true,
    },
}
return {
    "nvim-tree/nvim-tree.lua",
    opts = opts,
    cmd = "NvimTreeToggle",
    dependencies = "nvim-tree/nvim-web-devicons",
}
