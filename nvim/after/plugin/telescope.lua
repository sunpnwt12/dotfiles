require('telescope').setup {
    extensions = {
        hijack_netrw = true,
    },
    pickers = {
        find_files = {
            find_command = {
                'rg',
                '--ignore',
                '--hidden',
                '--files',

            }
        },
    }
}

