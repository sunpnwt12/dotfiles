require("bufferline").setup {
    options = {
       offsets = {
           {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                seprator = true,

           }
       },
   },
   highlights = require("catppuccin.groups.integrations.bufferline").get()
}
