local opts = {
    view_options = {
        show_hidden = true,
    },
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-[>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
    },
    delete_to_trash = true,
    trash_command = "trash-put",
}

return {
    "stevearc/oil.nvim",
    opts = opts,
    cmd = "Oil",
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
