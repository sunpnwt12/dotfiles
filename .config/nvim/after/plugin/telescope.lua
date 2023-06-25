require('telescope').setup {
    extensions = {
        hijack_netrw = true,
    }
}

require('telescope').load_extension "file_browser"
