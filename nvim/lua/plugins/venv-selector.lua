local opts = {
    search_venv_managers = true,
    search_workspace = true,
    search = false,

    dap_enabled = true,
    -- fd_binary_name (default: fd) - The name of the fd binary on your system. Some Debian based Linux Distributions like Ubuntu use ´fdfind´.
    fd_binary_name = "fdfind",

    -- poetry_path = "your_path_here",
    -- pipenv_path = "your_path_here",
    -- pyenv_path = "your_path_here",
    anaconda_path = "/home/sunpnwt/micromamba/envs",
}

return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        "mfussenegger/nvim-dap-python",
    },
    opts = opts,
    cmd = { "VenvSelect", "VenvSelectCached" },
}
