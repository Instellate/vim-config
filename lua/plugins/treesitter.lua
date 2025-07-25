return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    priority = 1000,
    config = function()
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
