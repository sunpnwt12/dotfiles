local builtins = require('null-ls').builtins

require('null-ls').setup({
    sources = {
        -- python
        builtins.formatting.black,

        -- lua
        builtins.formatting.lua_format,

        -- js, ts
        builtins.formatting.prettier,

        -- rust
        builtins.formatting.rustfmt,
    }
})
