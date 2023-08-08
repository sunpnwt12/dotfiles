-- come back and setup later
-- especially, where venv's path would be
local config = function()
    vim.api.nvim_create_user_command("SwitchEnvsPick", require("swenv.api").pick_venv, {})
    vim.api.nvim_create_user_command("SwitchEnvsCur", require("swenv.api").get_current_venv, {})
    require("swenv").setup({
        -- Should return a list of tables with a `name` and a `path` entry each.
        -- Gets the argument `venvs_path` set below.
        -- By default just lists the entries in `venvs_path`.
        get_venvs = function(venvs_path)
            return require("swenv.api").get_venvs(venvs_path)
        end,
        -- Path passed to `get_venvs`.
        venvs_path = vim.fn.expand("~/venvs"),
        -- Something to do after setting an environment, for example call vim.cmd.LspRestart
        post_set_venv = nil,
    })
    vim.g.is_swenv_active = true
end

return {
    "AckslD/swenv.nvim",
    config = config,
    ft = "python",
    cmd = { "SwitchEnvsPick", "SwitchEnvsCur" },
}
